require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  def token
    Knock::AuthToken.new(payload: { sub: users(:one).id }).token
  end

  test 'should get status code of unauthorized if token is not passed' do
    get :index, { user_id: 1}
    p response.body
    json_response = response.body
    assert_response 401
  end


  # test 'should be able to update profile' do
  #   put :update, {user_id: 1}
  #   json_response = response.body
  #   assert_equal nil, json_response["status"]
  # end

end
