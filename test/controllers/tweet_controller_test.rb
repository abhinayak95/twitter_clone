require 'test_helper'

class TweetControllerTest < ActionController::TestCase
  setup do
    @request.headers['Authorization'] = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjJ9.ph9i6Re3tkMM0nNib7pJBtiujVEhpxkiSTYMzf0Cx9I"

  end

  test 'should not be able to tweet if not logged in' do
    post :create, { tweet: 'This is my first tweet ever'}, headers: { "Authorization" => "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjJ9.ph9i6Re3tkMM0nNib7pJBtiujVEhpxkiSTYMzf0Cx9I" }
    assert_response 401
  end

  test 'should get all the tweets of the user' do
    get :show
    assert_response 401
  end
end
