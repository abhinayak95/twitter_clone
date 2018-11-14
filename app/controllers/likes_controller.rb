class LikesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user

  def index
    @likes = User.find(params[:user_id]).likes
    render :json => @likes
  end

  def create
    # begin
      # @like = current_user.likes.find(tweet_id: params[:id])
      # render :json => { error: {like: ['this tweet already']}, status: :bad_request}, :status => :bad_request
    # rescue ActiveRecord::RecordNotFound
      @like = current_user.likes.create(tweet_id: params[:tweet_id])
      render :json => @like
    # end
  end

  def destroy
    # begin
      @like = current_user.likes.where(tweet_id: params[:tweet_id]).destroy_all
      render :json => @like
    # rescue ActiveRecord::RecordNotFound
    #   render :json => { error: {like: ['this tweet, before unliking it']}, status: :bad_request}, :status => :bad_request
    # end
  end

  # def like_params
  #   params.permit(:tweet_id)
  # end
end
