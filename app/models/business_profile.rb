class BusinessProfile < ActiveRecord::Base
	has_many :user_business_profiles
  has_many :users, through: :user_business_profiles
  	
  	extend FriendlyId
  	friendly_id :name, use: :slugged

  geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates

 def full_street_address
 		[address1, address2, suburb, state, postcode].compact.join(', ')
 end
end

