//= require jquery
//= require jquery_ujs
//= require chosen-jquery
//= require jquery-ui/sortable
//= require cocoon
//= require_self

var setPosition = function(obj) {
  $('#point_latitude').val(obj.position.lat());
  $('#point_longitude').val(obj.position.lng());
};

var updatePosition = function() { setPosition(this); };
var updatePositionOf = function(marker) { setPosition(marker); };

var pinSymbol = function(color) {
    return {
        path: 'M 0,0 C -2,-20 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,-20 0,0 z',
        fillColor: color,
        fillOpacity: 1,
        strokeColor: '#000',
        strokeWeight: 1,
        scale: 1,
   };
};

var pasteCoordinates = function() {
  $(".js-coordinates").on("paste", function(event) {
      var clip = event.originalEvent.clipboardData.getData('text'),
          separator = ", ";

      if (clip.includes(separator)) {
        var splits = clip.split(separator);
        event.preventDefault();
        event.currentTarget.value = splits[0];
        $(this).closest('.grid').find('.grid-item:nth-of-type(2) input').val(splits[1]);
      }
  });
};

$(document).on('ready', function() {
  $('.js-chosen').chosen({
    disable_search: true,
    placeholder_text_multiple: " ",
    width: '100%'
  });

  $('.js-sortable').sortable({
    axis: 'y',
    handle: '.js-sortable-handle',
    update: function(_, ui) {
      $.post($(this).data('sortable-url'), {
        id: ui.item.data('id'),
        position: ui.item.index()
      });
    }
  });

  pasteCoordinates();

  $("form").on("cocoon:after-insert", function(event, pastedEl) {
    pasteCoordinates();

    var position = map.getCenter();
    var marker = new google.maps.Marker({
      map: map,
      position: position,
      draggable: true,
      label: (labelIndex++).toString()
    });

    marker.addListener('drag', function(event) {
      pastedEl.find(".grid-item:nth-of-type(1) input").val(event.latLng.lat());
      pastedEl.find(".grid-item:nth-of-type(2) input").val(event.latLng.lng());
    });
  });
});
