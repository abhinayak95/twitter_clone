class ProfileController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user

  def index
    begin
      @profile = current_user.profile
      render :json => @profile
    rescue ActiveRecord::RecordNotFound
      render :json => {error: {Profile: ["Doesn't exist. Try creating it first"] }, status: :not_found }, :status => :not_found
    end
  else
  end

  def create
    if Profile.exists?(user_id: current_user.id)
      render :json => {error: "Profile already exists! Try updating it", status: :unprocessable_entity }
    else
      @profile = current_user.profile.create(profile_params, user_id: current_user.id)
      if @profile.save
        render :json => @profile
      else
        render :json => {error: @profile.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    begin
      if current_user.profile.update(profile_params)
        render :json => @profile
      else
        render :json =>  { error: @user.errors, status: :unprocessable_entity }
      end
    rescue ActiveRecord::RecordNotFound
      render :json => {error: {Profile: ["Doesn't exist! Try creating it first"] }, status: :unprocessable_entity }
    end
  end

  def profile_params
    params.require(:profile).permit(:name, :dob, :bio, :avatar)
  end
end
