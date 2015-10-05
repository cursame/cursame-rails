class CatalogCSVParserWorker
  include Sidekiq::Worker

  def perform(catalog_id)
    catalog = Catalog.find_by_id(catalog_id)
    CatalogCSVParser.new(catalog).parse if catalog
  end
end
