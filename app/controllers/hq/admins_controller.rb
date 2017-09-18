class Hq::AdminsController < Hq::ApplicationController
  layout 'hq/application'

  before_action :set_admin, only: [:show, :edit, :update, :destroy, :toggle_is_active]
  add_breadcrumb "Yöneticiler", :hq_admins_path

  def index

    # @search = Admin.order(id: :desc).search(params[:q])
    # @admins = @search.result(distinct: true)
    # respond_with(@admins)

    # @search = Admin.ransack(params[:q])
    # @search.sorts = 'name desc' if @search.sorts.empty?
    # @admins = @search.result(distinct: true)
    # respond_with(@admins)

    @search = Admin.ransack(params[:q])
    @admins = @search.result(distinct:true)
    respond_with(@admins)
  end

  def show
    add_breadcrumb @admin.name, hq_admin_path(@admin)
    respond_with(@admin)
  end

  def new
    add_breadcrumb "Yeni Yönetici", new_hq_admin_path
    @admin = Admin.new
    respond_with(@admin)
  end

  def edit
    add_breadcrumb @admin.name, hq_admins_path(@admin)
    add_breadcrumb "Yönetici Düzenle", edit_hq_admin_path
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.save
    respond_with(:hq, @admin)
  end

  def update
    @admin.update(admin_params)
    respond_with(:hq, @admin)
  end

  def destroy
    @admin.destroy
    respond_with(:hq, @admin, location: request.referer)
  end

  def toggle_is_active
    if @admin.update( is_active: !@admin.is_active )
      @admin.is_active ?
          flash[:info] = "#{User.model_name.human} başarıyla aktif edildi" :
          flash[:info] = "#{User.model_name.human} başarıyla pasif edildi"
    else
      flash[:danger] = "HATA"
    end
    respond_with(:hq, @admin, location: request.referer)
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :name, :surname)
  end

end
