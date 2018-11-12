require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test 'should get user profile if exist' do
    get :show
    json_response = response.body
    assert_equal nil, json_response["status"]
  end

  test 'should be able to update profile' do
    get :update
    json_response = response.body
    assert_equal nil, json_response["status"]
  end
end
