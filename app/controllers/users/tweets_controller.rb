module Users

  class TweetsController < ApplicationController
    skip_before_filter :verify_authenticity_token
    before_action :authenticate_user, only: [:create, :update]

    def index
      @tweet = User.find(params[:user_id]).tweets
      render :json => @tweet.page(params[:page]).order('created_at DESC')
    end

    def show
      @tweet = current_user.tweets.where(id: params[:id]).first
      if !@tweet
        render :json => { error: { tweet:['not found']}, status: :not_found}, :status => :not_found
      else
        render :json => @tweet
      end
    end

    def create
      @tweet = current_user.tweets.create(tweet_params)
      if @tweet.save
        render :json => @tweet
      else
        puts @tweet.errors
        render :json => { error: @tweet.errors, status: :unprocessable_entity}, :status => :unprocessable_entity
      end
    end

    def update
      @tweet = current_user.tweets.where(id: params[:id]).first
      if @tweet && @tweet.update(tweet_params)
        render :json => @tweet
      else
        render :json => { error: @tweet.errors, status: :unprocessable_entity}, :status => :unprocessable_entity
      end
      # render :json => { error: {tweet:['not found']}, status: :unprocessable_entity}, :status => :unprocessable_entity
    end

    def tweet_params
      params.permit(:tweet)
    end

  end

end