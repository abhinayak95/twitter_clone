class FollowingController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user

  def follow
    if current_user.followings.where(params[:following_user_id]).first
      # todo remember
      render :json => { error:{following:['the user already']}}
    else
      @follow = current_user.followings.create(following_user_id: params[:user_id])
      render :json => @follow
    end
  end

  def unfollow
    # todo remember 2
    @following = current_user.followings.where(params[:following_user_id]).first
    if @following
      @following.destroy
      render :json => { message:{following:['unfollowed']}}
    else
      render :json => { message:{following:['not the user']}}
    end
  end
end
