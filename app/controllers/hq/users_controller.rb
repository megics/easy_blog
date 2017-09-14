class Hq::UsersController < Hq::ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Kullanıcılar", :hq_users_path

  def index
    @users = User.all.order(id: :desc)
    respond_with(@users)
  end

  def show
    add_breadcrumb @user.name, hq_users_path(@user)
    respond_with(@user)
  end

  def new
    add_breadcrumb "Yeni Kullanıcı", new_hq_user_path
    @user = User.new
    respond_with(@user)
  end

  def edit
    add_breadcrumb "Kullanıcı Düzenle", edit_hq_user_path
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(:hq, @user)
  end

  def update
    @user.update(user_params)
    respond_with(:hq, @user)
  end

  def destroy
    quser.destroy
    respond_with(:hq, @user, location: request_referer)
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :birth_date, :phone, :university, :address)
  end

end