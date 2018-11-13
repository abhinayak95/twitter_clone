require 'test_helper'

class FollowingControllerTest < ActionController::TestCase
  test 'following should return a status code of 401, if not logged in' do
    post :follow, {user_id: 1}
    assert_response 401
  end

  # check with the p in the following controller
  test 'should be able to follow if user is logged in' do
    post :follow, {user_id: 1}, headers: { "Authorization": "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjJ9.FHL7I7DuVtJOeKUkV69TYK0TRPSc7HFyi8UiDs04bFg" }
    assert_response 200
  end

  test 'should be able to unfollow the user if logged in' do
    post :unfollow, {user_id: 1}, headers: { "Authorization": "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjJ9.FHL7I7DuVtJOeKUkV69TYK0TRPSc7HFyi8UiDs04bFg" }
    assert_response 200
  end

  test 'unfollowing should return a status code of 401, if not logged in' do
    post :unfollow, {user_id: 1}
    assert_response 401
  end

end
