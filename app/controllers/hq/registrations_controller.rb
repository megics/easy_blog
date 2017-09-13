class Hq::RegistrationsController < Devise::RegistrationsController
  layout 'hq/application'

  before_action :authenticate_admin!
  before_action :redirect_admin, only: [:new, :create, :destroy]
  add_breadcrumb "Kontrol Paneli", :hq_dashboard_index_path

  def edit

  end

  private

  def redirect_admin
    redirect_to hq_root_path
  end

  def after_update_path_for(resource)
    hq_root_path
  end
end
