class CustomerImport
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations


  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_customers.map(&:valid?).all?
      imported_customers.each(&:save!)
      true
    else
      imported_customers.each_with_index do |customer, index|
        customer.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_caseworkers
    @imported_caseworkers ||= load_imported_caseworkers
  end

  def imported_customers
    @imported_customers ||= load_imported_customers
  end

  def load_imported_customers
    @allowed_attributes = [ "first_name", "last_name", "middle_initial", "sex", "dob", 
      "client_central_station_account_number", "language","memo","status_note",
      "install_date", "cancel_date", "initial_contact_authorization_date"]
    @allowed_attributes_insurance = ["venue", "isp_end_date",
      "medicaid_number", "diagnostics_code", "insurance_name"]
    @allowed_attributes_address = ["address_1", "address_2", "city", "state", "zip", "phone"]
    @allowed_attributes_system = ["lock_number", "test_call_number", "battery_date", "transmitter_date"]

    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)

    # customer lookup
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      if a = Customer.where("first_name = ? AND last_name = ? AND dob = ?", row["first_name"], row["last_name"], row["dob"]).first
        customer = a
      else
        customer = Customer.new
      end
      #lookup related tables for a match, or create a new entry
      system_type = SystemType.find_by_system_type(row["system_type"].upcase) || SystemType.create(system_type: (row["system_type"].upcase || "Unspecified"))
      transmitter_type = TransmitterType.find_mitteansponder_type(row["transmitter_type"].titleize) || TransmitterType.create(transmitter_type: (row["transmitter_type"].titleize || "Unspecified"))
      region = Region.find_by_region_name(row["region_name"]) || Region.create(region_name: row["region_name"])
      caseworker = Caseworker.find_by_name(row["caseworker"]) || Caseworker.create(name: row["caseworker"],phone: row["cw phone"], fax: row["cw fax"])
      insurance = Insurance.find_by_insurance_name(row["insurance_name"]) || customer.build_insurance
      #build related tables for customer if they are missing
      unless customer.addresses.first
        customer.addresses.build
      end
      unless customer.addresses.second
        customer.addresses.build
      end
      unless customer.system
        customer.build_system
      end
      unless customer.insurance
        customer.build_insurance
      end
      customer.assign_attributes(row.to_hash.select { |k,v| @allowed_attributes.include? k })
      customer.memo = [customer.memo, row["temp"]].join(' ')
      #had to use different logic depending on the existence of the customer. customer.id is true if we found a customer, not if we just created one.
      if customer.id?
        customer.addresses.first.update(row.to_hash.select { |k,v| @allowed_attributes_address.include? k })
        customer.addresses.second.update(address_1: row["BADD1"], address_2: row["BADD2"], city: row["BCITY"], state: row["BST"], zip: row["BZIP"], phone: row["phone"], is_billing_address: true)
      else
        customer.addresses.first.assign_attributes(row.to_hash.select { |k,v| @allowed_attributes_address.include? k })
        customer.addresses.second.assign_attributes(address_1: row["BADD1"], address_2: row["BADD2"], city: row["BCITY"], state: row["BST"], zip: row["BZIP"], phone: row["phone"], is_billing_address: true)
      end
      #strange import bug on zip
      customer.addresses.each do |a|
        a.zip = a.zip.split('.').first
      end
      #assign foreign keys
      customer.region_id = region.id
      customer.caseworker_id=caseworker.id
      customer.system.assign_attributes(system_type_id: system_type.id, transmitter_type_id: transmitter_type.id)
      customer.system.attributes = row.to_hash.select { |k,v| @allowed_attributes_system.include? k }
      customer.insurance.attributes = row.to_hash.select { |k,v| @allowed_attributes_insurance.include? k }
      #check for private customer. Private customers will have "private" as their medicaid number, and are not billed monthly
      unless "p".in? customer.insurance.medicaid_number.downcase
        customer.billing_interval = BillingInterval.find_by_billing_interval_name("Monthly")
      end
      customer
    end
  end

 


  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end