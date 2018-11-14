class FollowingController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user

  def follow
    begin
      current_user.followings.find(params[:user_id])
      render :json => { error:{following:['the user already']}, status: :unprocessable_entity}, status: :unprocessable_entity
    rescue ActiveRecord::RecordNotFound
      @follow = current_user.followings.create(following_user_id: params[:user_id])
      render :json => @follow
    end
  end

  def unfollow
    begin
      @following = current_user.followings.find(params[:user_id])
      @following.destroy
      render :json => { message:{following:['unfollowed']}}
    rescue ActiveRecord::RecordNotFound
      render :json => { message:{following:['not the user']}}
    end
  end

end