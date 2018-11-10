class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get
    permitted = params.permit(:username, :password)
    user = User.where(permitted)
    render :json => user
  end

  def create
    permitted = params.permit(:username, :password)
    user = User.create(permitted)
    render :json => user
  end

end
