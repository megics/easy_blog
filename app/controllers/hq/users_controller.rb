class Hq::UsersController < Hq::ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy, :toggle_is_active]
  add_breadcrumb "Kullanıcılar", :hq_users_path

  def index
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true)
    respond_with(@users)
  end

  def show
    add_breadcrumb @user.email, hq_user_path(@user)
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
    @user.destroy
    respond_with(:hq, @user, location: request_referer)
  end

  def toggle_is_active
    if @user.update( is_active: !@user.is_active )
      @user.is_active ?
          flash[:info] = "#{Admin.model_name.human} başarıyla aktif edildi" :
          flash[:info] = "#{Admin.model_name.human} başarıyla pasif edildi"
    else
      flash[:danger] = "HATA"
    end
    respond_with(:hq, @user, location: request.referer)
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :birth_date, :phone, :university, :address)
  end

end