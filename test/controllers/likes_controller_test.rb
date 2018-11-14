require 'test_helper'

class LikesControllerTest < ActionController::TestCase

  def token
    Knock::AuthToken.new(payload: { sub: users(:one).id }).token
  end

  test 'should not be able to like a tweet, if not logged in' do
    post :create, { user_id: 1, tweet_id: 1}
    assert_response 401
  end

  test 'should be able to like a tweet, if logged in' do
    @request.headers["Authorization"] = "JWT #{token}"
    post :create, { user_id: 1, tweet_id: 1}
    assert_response 200
  end

  test 'should not be able to unlike a tweet, if not logged in' do
    post :destroy, { user_id: 1, tweet_id: 1}
    assert_response 401
  end

  test 'should be able to unlike a tweet, if logged in' do
    @request.headers["Authorization"] = "JWT #{token}"
    post :destroy, { user_id: 1, tweet_id: 1}
    assert_response 200
  end
end
