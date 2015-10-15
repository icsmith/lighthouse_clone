class Customer < ActiveRecord::Base
	validates :first_name, :last_name, :sex, :dob, :status, presence: true
	validates_uniqueness_of :first_name, :scope => :last_name

	has_one :system
	has_one :insurance, dependent: :destroy
	has_many :addresses, dependent: :destroy
	belongs_to :caseworker
	belongs_to :billing_interval
	belongs_to :region
	accepts_nested_attributes_for :addresses
	accepts_nested_attributes_for :system




	

def self.import(file)
  allowed_attributes = [ "id","first_name", "last_name", "sex", "dob","address_1","address_2","city","state","zip"]
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).collect do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    customer = find_by_id(row["id"]) || new
    customer.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
    customer.save!
  end
end



	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::Csv.new(file.path)
	  when ".xls" then Roo::Excel.new(file.path)
	  when ".xlsx" then Roo::Excelx.new(file.path)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end


	

end
