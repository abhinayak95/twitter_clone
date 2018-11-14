require 'test_helper'

class FollowingControllerTest < ActionController::TestCase
  def token
    Knock::AuthToken.new(payload: { sub: users(:one).id }).token
  end

  test 'following should return a status code of 401, if not logged in' do
    post :follow, {user_id: 1}
    assert_response 401
  end

  # check with the p in the following controller
  test 'should be able to follow if user is logged in' do
    @request.headers["Authorization"] = "JWT #{token}"
    post :follow, {user_id: 2}
    assert_response 200
  end

  test 'should be able to unfollow the user if logged in' do
    @request.headers["Authorization"] = "JWT #{token}"
    post :unfollow, {user_id: 1}
    assert_response 200
  end

  test 'unfollowing should return a status code of 401, if not logged in' do
    post :unfollow, {user_id: 1}
    assert_response 401
  end

end
