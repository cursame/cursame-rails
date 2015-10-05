require 'charlock_holmes'

class CatalogCSVParser
  attr_reader :catalog

  def initialize(catalog)
    @catalog = catalog
    @line = 1
  end

  def parse
    path = csv_file_path
    CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
      create_user(row)
    end
    update_catalog_status
  end

  private

  def update_catalog_status
    if @catalog.catalog_errors.any?
      @catalog.status = 'rejected'
    else
      @catalog.status = 'accepted'
    end
    @catalog.save
  end

  def create_catalog_errors(user)
    user.errors.messages.each do |field, messages|
      catalog_error = CatalogError.new
      catalog_error.row = @line
      catalog_error.email = user.email
      catalog_error.field = field.to_s
      catalog_error.catalog = @catalog

      catalog_error.errors_message = messages.to_sentence.capitalize

      catalog_error.save
    end
  end

  def create_user(row)
    user = User.new(row_info(row))
    create_catalog_errors(user) unless user.save

    @line += 1
  end

  def row_info(row)
    sanitaize_row!(row)
    {
      email:          row[:correo],
      first_name:     row[:nombre].split.map(&:capitalize).join(' '),
      last_name:      row[:apellidos].split.map(&:capitalize).join(' '),
      subdomain:      row[:subdominio_de_la_red].downcase,
      permissionings_attributes: {
        "0" => {
          role_id: RoleIdentifier.new(row[:rol]).detect_role }
        },
      password:       Devise.friendly_token,
      domain:         @catalog.domain,
      self_register:  false,
      accepted_terms: true
    }
  end

  def csv_file_path
    Rails.env.production? ? @catalog.csv_file.url : @catalog.csv_file.file.path
  end

  def sanitaize_row!(row)
    row.each do |key, value|
      detector = CharlockHolmes::EncodingDetector.detect(value)
      row[key] = CharlockHolmes::Converter.convert(value, detector[:encoding], 'UTF-8').strip
    end
  end
end
