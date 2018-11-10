require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "Given the username and password, should be able to create new user" do
    post 'get', params:{
      username: 'test1',
      password: 'test@1'
    }
    assert_response 200
  end

  test "Given the credentials, should be able to create new user" do
    post 'create', params:{
      username: 'test1',
      password: 'test@1'
    }
    assert_response 200
  end
end
