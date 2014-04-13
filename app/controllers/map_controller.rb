class MapController < ApplicationController
  def index
  	@business_profiles = BusinessProfile.all
  end
end
