class FollowingController < ApplicationController

  def follow
    @follow = Following.create(user_id:current_user.id, following_user_id: params[:user_id])
    if @follow
      render :json => @follow
    else
    end
  end
end
