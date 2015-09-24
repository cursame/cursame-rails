$(function() {
  /*
  * Translated default messages for the jQuery validation plugin.
  * Locale: ES
  */
  jQuery.extend(jQuery.validator.messages, {
    required: I18n.t("validator.required"),
    remote: I18n.t("validator.remote"),
    email: I18n.t("validator.email"),
    url: I18n.t("validator.url"),
    date: I18n.t("validator.date"),
    dateISO: I18n.t("validator.dateISO"),
    number: I18n.t("validator.number"),
    digits: I18n.t("validator.digits"),
    creditcard: I18n.t("validator.creditcard"),
    equalTo: I18n.t("validator.equalTo"),
    accept: I18n.t("validator.accept"),
    maxlength: jQuery.validator.format("Por favor, no escribas más de {0} caracteres."),
    minlength: jQuery.validator.format("Por favor, no escribas menos de {0} caracteres."),
    rangelength: jQuery.validator.format("Por favor, escribe un valor entre {0} y {1} caracteres."),
    range: jQuery.validator.format("Por favor, escribe un valor entre {0} y {1}."),
    max: jQuery.validator.format("Por favor, escribe un valor menor o igual a {0}."),
    min: jQuery.validator.format("Por favor, escribe un valor mayor o igual a {0}.")
  });
});
