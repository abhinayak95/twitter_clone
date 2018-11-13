class ProfileController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user

  def create
    p "this is user id #{current_user.id}"
    if Profile.exists?(user_id: current_user.id)
      render :json => {error: "Profile already exists! Try updating it", status: :unprocessable_entity }
    else
      @profile = Profile.new(profile_params, user_id: current_user.id)
      if @profile.save
        render :json => @profile
      else
        render :json => {error: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    p current_user
    begin
      @profile = Profile.where(user_id: current_user.id).first
      render :json => @profile
    rescue ActiveRecord::RecordNotFound
      render :json => {error: {Profile: ["Doesn't exist! Try creating it first"] }, status: :unprocessable_entity }
    end
    else
  end

  def update
    begin
      @profile = Profile.where(user_id: current_user.id).first
      if @profile.update(profile_params)
        render :json => @profile
      else
        render :json =>  { error: @user.errors, status: :unprocessable_entity }
      end
    rescue ActiveRecord::RecordNotFound
      render :json => {error: {Profile: ["Doesn't exist! Try creating it first"] }, status: :unprocessable_entity }
    end
  end

  def profile_params
    # params.require(:profile).permit(:name, :dob, :bio)
    {name: params[:name], dob: params[:dob], bio: params[:bio], user_id: current_user.id, avatar: params[:avatar]}
  end
end
