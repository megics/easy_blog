class Hq::AdminsController < ApplicationController

  before_action :set_admin, only: [:show, :edit, :update, :destroy, :toggle_is_active]
  ## add_breadcrumb "Yöneticiler", :hq_admins_path

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params

  end

  def toggle_is_active

  end

end
