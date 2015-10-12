module CatalogsHelper
  def select_domain(catalog)
    domain_options = ['cursa.me', 'cursame.es']
    options_for_select(domain_options, catalog.domain)
  end
end
