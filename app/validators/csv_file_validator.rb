require 'charlock_holmes'

class CsvFileValidator < ActiveModel::EachValidator

  def validate_each(catalog, csv_file, file_uploader)

    unless file_uploader.blank?
      begin

        validates_encoding(catalog, file_uploader)
        validates_not_malformed_csv(catalog, file_uploader)
        validates_not_empty_csv(catalog, file_uploader)

      rescue CSV::MalformedCSVError => e
        catalog.errors[csv_file] << I18n.t('activerecord.errors.messages.csv_file.malformed')
      rescue Exceptions::EmptyCsvError => e
        catalog.errors[csv_file] << I18n.t('activerecord.errors.messages.csv_file.empty')
      rescue Exceptions::UnknownEncodingError => e
        catalog.errors[csv_file] << I18n.t('activerecord.errors.messages.csv_file.unknown_encoding')
      end
    end
  end


  def validates_encoding(catalog, file_uploader)
    content = File.read(file_uploader.current_path)
    detector = CharlockHolmes::EncodingDetector.detect(content)

    raise Exceptions::UnknownEncodingError unless detector && detector[:encoding]
  end

  def validates_not_malformed_csv(catalog, file_uploader)
    content = File.read(file_uploader.current_path)
    raise CSV::MalformedCSVError unless content.size > 0
  end

  def validates_not_empty_csv(catalog, file_uploader)
    number_of_rows = CSV.read(file_uploader.current_path).length
    raise Exceptions::EmptyCsvError unless number_of_rows > 1
  end

end
