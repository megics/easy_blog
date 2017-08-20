class UsersController < ApplicationController
  before action :authenticate_user!

=begin
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit

  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Erişilemez!"
    end
  end
=end

end
