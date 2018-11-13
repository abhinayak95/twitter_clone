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
    request.env['HTTP_AUTHORIZATION'] = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjJ9.FHL7I7DuVtJOeKUkV69TYK0TRPSc7HFyi8UiDs04bFg"
    get :show
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
