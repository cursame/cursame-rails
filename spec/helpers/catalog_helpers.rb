require 'fileutils'

module CatalogHelpers
  def prepare_file(filename)
    root_dir = "#{Rails.root}/spec/fixtures"
    src = "#{root_dir}/files/catalog/#{filename}"
    dest = "#{root_dir}/tmps/#{rand(1000)}_#{filename}"

    FileUtils.cp src, dest

    File.new(dest)
  end

  def min_password_message
    message = I18n.t('activerecord.errors.messages.too_short')[:other]
    message.gsub("%{count}", Devise.password_length.first.to_s)
  end

  def max_password_message
    message = I18n.t('activerecord.errors.messages.too_long')[:other]
    message.gsub("%{count}", Devise.password_length.last.to_s)
  end
end
