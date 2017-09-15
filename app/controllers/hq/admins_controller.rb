class Hq::AdminsController < Hq::ApplicationController
  layout 'hq/application'

  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Yöneticiler", :hq_admins_path

  def index
    # @admins = Admin.all.order(id: :desc)
    # respond_with(@admins)
    @search = Admin.order(id: :desc).search(params[:q])
    @admins = @search.result(distinct: true)
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

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :name, :surname)
  end

end
