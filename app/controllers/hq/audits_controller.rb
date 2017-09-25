class Hq::AuditsController < ApplicationController
  add_breadcrumb "İşlem Geçmişleri", :hq_audits_path

  def index
    @search = User.ransack(params[:q])
    @audits = @search.result(distinct: true)
    respond_with(@audits)
  end

  def show
    @audit = Audit.find(params[:id])
    add_breadcrumb @audit.id hq_audit_path(id: @audit)
  end

end
