class TweetController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user, only: [:create, :update]

  def index
    @tweet = Tweet.where(user_id: params[:user_id])
    render :json => @tweet
  end

  def show
      @tweet = Tweet.where("user_id = ? AND id = ?", params[:user_id], params[:id]).first
      if !@tweet
        render :json => { error: { tweet:['not found']}, status: :unprocessable_entity}, :status => :unprocessable_entity
      else
        render :json => @tweet
      end
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
    p "#{params[:user_id]} ..... #{current_user.id}"
    begin
      # if params[:user_id] != current_user.id
      #   return render :status => :unprocessable_entity
      # end
      @tweet = Tweet.where("user_id = ? AND id = ?", params[:user_id], params[:id]).first
      if @tweet && @tweet.update(tweet_params)
        render :json => @tweet
      else
        render :json => { error: @tweet.errors, status: :unprocessable_entity}, :status => :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { error: {tweet:['not found']}, status: :unprocessable_entity}, :status => :unprocessable_entity
    end
  end

  def tweet_params
    { tweet: params[:tweet], user_id: current_user.id }
  end
end
