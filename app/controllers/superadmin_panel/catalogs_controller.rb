class SuperadminPanel::CatalogsController < SuperadminPanel::BaseController
  include ActiveModel::ForbiddenAttributesProtection

  def index
    @catalogs = Catalog.order('created_at desc').paginate(page: params[:page], per_page: 30)
  end

  def new
    @catalog = Catalog.new
  end

  def create
    @catalog = Catalog.new(catalog_params)
    if @catalog.save
      redirect_to superadmin_panel_catalog_path(@catalog)
    else
      render action: :new
    end
  end

  def show
    @catalog_errors = CatalogError.where(catalog_id: params[:id])
    @catalog_errors = @catalog_errors.paginate(page: params[:page], per_page: 30)

    @catalog = Catalog.find_by_id(params[:id])
  end

  def destroy
    catalog = Catalog.find_by_id params[:id]
    catalog.destroy

    redirect_to superadmin_panel_catalogs_path
  end

  private

  def catalog_params
    params.require(:catalog).permit(:domain, :csv_file)
  end
end
