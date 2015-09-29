class Customer < ActiveRecord::Base
	validates :first_name, :last_name, :sex, :dob, :status, presence: true

	has_one :system
	has_one :insurance
	has_many :addresses
	belongs_to :caseworker
	belongs_to :billing_interval
	belongs_to :region
	accepts_nested_attributes_for :addresses
	accepts_nested_attributes_for :system

	def self.search(search)
		if search
			num = search.to_i
			where("first_name LIKE :search 
				OR last_name LIKE :search
				OR client_central_station_account_number = :num", 
				search: "%#{search}%", num: num)
		end

		# where("last_name LIKE ?", "%#{search}%")
		
		# Item.where('game_name LIKE :search OR genre LIKE :search OR console LIKE :search', search: "%#{search}%")

	end
end
