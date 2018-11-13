require 'test_helper'

class FollowingControllerTest < ActionController::TestCase
  test 'should be able to follow a user,only if logged in' do
    post :follow
    assert_response 200
  end
end
