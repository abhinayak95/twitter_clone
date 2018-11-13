class TweetController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user, only: [:create, :update]

  def index
    @tweet = Tweet.where(user_id: current_user.id)
    render :json => @tweet
  end

  def show
    begin
      @tweet = Tweet.find(params[:id])
      render :json => @tweet
    rescue ActiveRecord::RecordNotFound
      render :json => { error: { tweet:['not found']}, status: :unprocessable_entity}, :status => :unprocessable_entity
    end
    @twet = Tweet
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      render :json => @tweet
    else
      puts @tweet.errors
      render :json => { error: @tweet.errors, status: :unprocessable_entity}, :status => :unprocessable_entity
    end
  end

  def update
    p "tweet methods #{@tweet.public_methods}"
    begin
      @tweet = Tweet.find(params[:tweet_id])
      render :json => @tweet
    rescue ActiveRecord::RecordNotFound
      render :json => { error: {tweet:['not found']}, status: :unprocessable_entity}, :status => :unprocessable_entity
    end
  end

  def tweet_params
    { tweet: params[:tweet], user_id: current_user.id }
  end
end
