#encoding: utf-8

I18n.default_locale = :es

LANGUAGES = [
  ['English', 'en'],
  ["Espa&ntilde;ol".html_safe, 'es']
]

I18n.load_path += Dir[Rails.root.join('config', 'locales','**','*.{rb,yml}')]

I18n.available_locales = [:en, :es, :es_meems, :devise]

I18n.enforce_available_locales = true
