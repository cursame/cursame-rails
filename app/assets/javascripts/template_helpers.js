Handlebars.registerHelper('i18n',
  function(str){
    return (I18n != undefined ? I18n.t(str) : str);
  }
);
