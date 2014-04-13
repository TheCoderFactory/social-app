json.array!(@business_profiles) do |business_profile|
  json.extract! business_profile, :id, :name, :email, :phone, :tagline, :about, :url, :blog, :twitter, :facebook, :linkedin, :google, :github, :image, :slug, :employees, :hiring, :latitude, :longitude, :owner
  json.url business_profile_url(business_profile, format: :json)
end
