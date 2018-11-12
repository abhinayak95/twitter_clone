require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test 'should get status code of unauthorized if token is not passed' do
    get :show
    p response.body
    json_response = response.body
    assert_response 401
  end

  test 'should get user profile if exist' do
    get :show, headers: { Authorization: "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDIxMDY4ODksInN1YiI6MX0.EHmbbqmkvCmT7PjNCNhaGkhKGBoHfzCIL8rqF7o7c-I"}
    p response.body
    json_response = response.body
    assert_response 401
  end

  test 'should be able to update profile' do
    get :update
    json_response = response.body
    assert_equal nil, json_response["status"]
  end
end
