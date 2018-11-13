class TweetController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      render :json => @tweet
    else
      puts @tweet.errors
      render :json => { error: @tweet.errors, status: :unprocessable_entity}, :status => :unprocessable_entity
    end
  end

  def show
    @tweet = Tweet.where(user_id: current_user.id)
    render :json => @tweet
  end

  def tweet_params
    { tweet: params[:tweet], user_id: current_user.id }
  end
end
