class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

   def edit
     @user = User.find(params[:id])
     ##@profile = @user.find(params[:id])
   end

  def show
    @user = User.find(params[:id])
    # unless @user == current_user
    #   redirect_to root_path, :alert => "Erişilemez!"
    # end
  end

end
