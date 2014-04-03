AJAXLastestActivities = {
  init: function( nodes ) {
    var self = this;

    $.each(nodes, function(index, item) {
      var elem = $(item),
          type = elem.data('type'),
          page = elem.data('page'),
          params = { page: page, activity_type: type };

      self.fetch( params, elem );
    });

    self.bindEvents();
  },
  bindEvents: function() {
    var self = this;
    $('.load-more-upcomming-activities').live('click', function(event) {
      self.loadMoreActivities(this)
    });;
  },
  fetch: function( params, elem ) {
    var self = this;

    $.getJSON(
      'activities_for_today.json',
      params,
      function(json, textStatus) {
        self.renderActivities( json, elem, params );
      }
    );
  },
  renderActivities: function( json, elem, params ) {
    if ( json.length > 0 ) {
      elem.append( HandlebarsTemplates['content-sidebar/lastest-activities/activity']( json ));
    } else {
      if ( params.activity_type == 'Delivery' ) {
        elem.append( HandlebarsTemplates['content-sidebar/lastest-activities/no-deliveries-for-come']());
      } else {
        elem.append( HandlebarsTemplates['content-sidebar/lastest-activities/no-surveys-for-come']());
      }
    };

    var nextPage = parseInt(elem.attr('data-page')) + 1;
    elem.attr('data-page', nextPage);
  },
  loadMoreActivities: function( obj ) {
    var handler = $(obj),
        box = handler.closest('.ajax-lastest-activities'),
        type = box.attr('data-type'),
        page = box.attr('data-page'),
        params = { page: page, activity_type: type };

    handler.remove();
    this.fetch( params, box );
  }
};

$(function() {
  var nodes = $('.ajax-lastest-activities');
  if ( nodes.length ) {
    AJAXLastestActivities.init( nodes );
  };
});


