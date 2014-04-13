require 'test_helper'

class BusinessProfilesControllerTest < ActionController::TestCase
  setup do
    @business_profile = business_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_profile" do
    assert_difference('BusinessProfile.count') do
      post :create, business_profile: { about: @business_profile.about, blog: @business_profile.blog, email: @business_profile.email, employees: @business_profile.employees, facebook: @business_profile.facebook, github: @business_profile.github, google: @business_profile.google, hiring: @business_profile.hiring, image: @business_profile.image, latitude: @business_profile.latitude, linkedin: @business_profile.linkedin, longitude: @business_profile.longitude, name: @business_profile.name, owner: @business_profile.owner, phone: @business_profile.phone, slug: @business_profile.slug, tagline: @business_profile.tagline, twitter: @business_profile.twitter, url: @business_profile.url }
    end

    assert_redirected_to business_profile_path(assigns(:business_profile))
  end

  test "should show business_profile" do
    get :show, id: @business_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_profile
    assert_response :success
  end

  test "should update business_profile" do
    patch :update, id: @business_profile, business_profile: { about: @business_profile.about, blog: @business_profile.blog, email: @business_profile.email, employees: @business_profile.employees, facebook: @business_profile.facebook, github: @business_profile.github, google: @business_profile.google, hiring: @business_profile.hiring, image: @business_profile.image, latitude: @business_profile.latitude, linkedin: @business_profile.linkedin, longitude: @business_profile.longitude, name: @business_profile.name, owner: @business_profile.owner, phone: @business_profile.phone, slug: @business_profile.slug, tagline: @business_profile.tagline, twitter: @business_profile.twitter, url: @business_profile.url }
    assert_redirected_to business_profile_path(assigns(:business_profile))
  end

  test "should destroy business_profile" do
    assert_difference('BusinessProfile.count', -1) do
      delete :destroy, id: @business_profile
    end

    assert_redirected_to business_profiles_path
  end
end
