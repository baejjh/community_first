require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  test "should get how" do
    get :how
    assert_response :success
  end

  test "should get why" do
    get :why
    assert_response :success
  end

  test "should get who" do
    get :who
    assert_response :success
  end

end
