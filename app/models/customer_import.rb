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

  def imported_customers
    @imported_customers ||= load_imported_customers
  end

  def load_imported_customers
    @allowed_attributes = [ "id","first_name", "last_name", "sex", "dob"]
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      customer = Customer.find_by_id(row["id"]) || Customer.new
      customer.attributes =  row.to_hash.select { |k,v| @allowed_attributes.include? k }
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