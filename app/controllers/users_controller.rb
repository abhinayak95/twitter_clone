class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def create
    @user = User.new(user_params)
    if User.exists?(email: params[:user][:email])
      render :json => { error: "email id already registered", status: :unprocessable_entity }
    else
      if @user.save
        render :json => @user
      else
        render :json => { error: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
