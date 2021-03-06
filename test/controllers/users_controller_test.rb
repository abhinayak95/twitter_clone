require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should create new user" do
    post :create, user: { email: 'test3', password: 'test3' }
    assert_response :success
  end

  test "should throw an error if email is missing" do
    post :create, user: { password: 'test3' }
    json_response = JSON.parse(response.body)
    assert_equal ["can't be blank"], json_response["error"]["email"]
  end

  test "should throw an error if password is missing" do
    post :create, user: { email: 'test3' }
    json_response = JSON.parse(response.body)
    assert_equal 'unprocessable_entity', json_response["status"]
  end

  test "should throw an error if email is already registered" do
    post :create, user: { email: 'test1@test.com', password: 'test1' }
    json_response = JSON.parse(response.body)
    assert_equal 'unprocessable_entity', json_response["status"]
  end

end
