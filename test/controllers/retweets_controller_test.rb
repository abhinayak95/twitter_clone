require 'test_helper'

class RetweetsControllerTest < ActionController::TestCase

  def token
    Knock::AuthToken.new(payload: { sub: users(:one).id }).token
  end

  test 'should not be able to retweet without logging in' do
    post :create, {user_id:1, tweet_id: 1}
    assert_response 401
  end

  test 'should not be able to retweet when logged in' do
    @request.headers["Authorization"] = "JWT #{token}"
    post :create, {user_id:1, tweet_id: 1}
    assert_response 200
  end

end
