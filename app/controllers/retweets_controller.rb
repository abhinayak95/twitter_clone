class RetweetsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user

  def index
    @retweet = current_user.retweets
    render :json => @retweet
  end
  def create
    @retweet = current_user.retweets.create(retweet_params)
    render :json => @retweet
  end

  def retweet_params
    params.permit(:tweet_id)
  end
end
