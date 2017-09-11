class Hq::AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy, :toggle_is_active]

  def index
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params

  end

end
