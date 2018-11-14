require 'test_helper'
# require '../../app/controllers/users/tweets_controller.rb'

class TweetsControllerTest < ActionController::TestCase

  def setup
    @controller = Users::TweetsController.new
  end

  def token
    Knock::AuthToken.new(payload: { sub: users(:one).id }).token
  end

  test 'should not be able to tweet if not logged in' do
    post :create, { tweet: 'This is my first tweet ever', user_id: 1}
    assert_response 401
  end

  test 'should get five tweets on first page, without an authentication' do
    get :index, { user_id: 1, page:1}
    json_response = JSON.parse(response.body)
    assert_equal 5, json_response.length
  end

  test 'should get one tweet on second page, without an authentication' do
    get :index, { user_id: 1, page:2}
    json_response = JSON.parse(response.body)
    assert_equal 1, json_response.length
  end

  test 'should be able to update the tweet of his own' do
    @request.headers['Authorization'] = "JWT #{token}"
    patch :update, { user_id:1, id:1, tweet: "I am updating my first tweet"}
    assert_response 200
  end

  test 'should give back status code of 401 if try updating another users tweet' do
    patch :update, { user_id:2, id:3, tweet: "I am updating my first tweet"}
    assert_response 401
  end
end
