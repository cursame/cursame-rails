class SubdomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    network = Network.find_by_subdomain(record.subdomain)
    unless network
      record.errors[attribute] << I18n.t('activerecord.errors.messages.subdomain.invalid_network')
    end
  end
end
