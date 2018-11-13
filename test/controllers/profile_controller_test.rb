require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test 'should get status code of unauthorized if token is not passed' do
    get :index, { user_id: 1}
    p response.body
    json_response = response.body
    assert_response 401
  end

  test 'should get user profile if exist' do
    @request.headers["Authorization"] = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjJ9.FHL7I7DuVtJOeKUkV69TYK0TRPSc7HFyi8UiDs04bFg"
    # get :show
    # p @request.headers
    json_response = response.body
    assert_response 200
  end

  # test 'should be able to update profile' do
  #   put :update, {user_id: 1}
  #   json_response = response.body
  #   assert_equal nil, json_response["status"]
  # end

  # test 'ok' do
  #   get :test_method,  headers: { "Authorization": "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjJ9.FHL7I7DuVtJOeKUkV69TYK0TRPSc7HFyi8UiDs04bFg" }
  #   assert_response 200
  #   # p requset.headers
  # end
end
