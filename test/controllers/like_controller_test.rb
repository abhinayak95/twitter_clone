require 'test_helper'

class LikeControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should be able to like a tweet' do
    post :create, { tweet_id: 1}
    assert_response 200
  end
end
