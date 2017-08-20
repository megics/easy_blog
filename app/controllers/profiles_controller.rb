class ProfilesController < ApplicationController
  ##before_action :find_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def edit
    @profile = Profile.find( params[:id])
  end

  def update
    @profile = Profile.find( params[:id])
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render 'edit'
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    ##redirect_to @profiles_path
  end

  private

=begin
  def find_profile
    @profile = Profile.find params[:id]
  end
=end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone, :university, :address)
  end

end
