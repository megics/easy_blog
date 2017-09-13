class Hq::UsersController < Hq::ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #add_breadcrumb "Kullanıcılar", :hq_users_path


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :surname, :time_zone)
  end

end