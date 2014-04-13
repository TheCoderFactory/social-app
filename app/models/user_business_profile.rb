class UserBusinessProfile < ActiveRecord::Base
  belongs_to :user
  belongs_to :business_profile
end
