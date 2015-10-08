class SuperadminPanel::CatalogsController < SuperadminPanel::BaseController
  include ActiveModel::ForbiddenAttributesProtection

  def index
    @catalogs = Catalog.order('created_at desc').paginate(page: params[:page], per_page: 30)
  end

  def destroy
    catalog = Catalog.find_by_id params[:id]
    catalog.destroy

    redirect_to superadmin_panel_catalogs_path
  end
end
