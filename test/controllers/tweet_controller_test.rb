require 'test_helper'

class TweetControllerTest < ActionController::TestCase
  def token
    Knock::AuthToken.new(payload: { sub: users(:one).id }).token
  end

  test 'should not be able to tweet if not logged in' do
    post :create, { tweet: 'This is my first tweet ever', user_id: 1}
    assert_response 401
  end

  test 'should get all the tweets of the user, without an authentication' do
    assert_raise NoMethodError do
      get :index, { user_id: 1}
    end
  end

  test 'should be able to update the tweet of his own' do
    @request.headers['Authorization'] = "JWT #{token}"
    patch :update, { user_id:1, id:1, tweet: "I am updating my first tweet"}
    assert_response 200
  end

  test 'should give back status code of 401 if try updating another users tweet' do
    @request.headers['Authorization'] = "JWT #{token}"
    patch :update, { user_id:2, id:3, tweet: "I am updating my first tweet"}
    assert_response 401
  end
end
