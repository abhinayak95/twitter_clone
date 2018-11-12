class ProfileController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  before_action :authenticate_user

  def create
    @user_id = current_user.id
    p profile_params
    @profile = Profile.new(profile_params, user_id: current_user.id)
      if @profile.save
        render :json => @profile
      else
        render {error :@profile.errors, status: :unprocessable_entity }
      end
  end

  def show
    @profile = Profile.where(user_id: current_user.id)
      render :json => @profile
      # else
      #   format.json { render json: @profile.errors, status: :unprocessable_entity }
      # end
  end

  def update
    if @profile.update(user_params)
      render :json => @profile
    else
      render :json =>  { error: @user.errors, status: :unprocessable_entity }
    end
  end

  def profile_params
    # params.require(:profile).permit(:name, :dob, :bio)
    {name: params[:name], dob: params[:dob], bio: params[:bio], user_id: current_user.id}
  end
end
