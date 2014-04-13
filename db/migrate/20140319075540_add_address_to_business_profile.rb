class AddAddressToBusinessProfile < ActiveRecord::Migration
  def change
    add_column :business_profiles, :address1, :string
    add_column :business_profiles, :address2, :string
    add_column :business_profiles, :suburb, :string
    add_column :business_profiles, :state, :string
    add_column :business_profiles, :postcode, :string
  end
end
