class CreateUserBusinessProfiles < ActiveRecord::Migration
  def change
    create_table :user_business_profiles do |t|
      t.references :user, index: true
      t.references :business_profile, index: true

      t.timestamps
    end
  end
end
