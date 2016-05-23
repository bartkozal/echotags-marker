//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require chosen-jquery
//= require_self

var setPosition = function(obj) {
  document.getElementById('point_latitude').value = obj.position.lat();
  document.getElementById('point_longitude').value = obj.position.lng();
}

var updatePosition = function() { setPosition(this); }
var updatePositionOf = function(marker) { setPosition(marker); }

var pinSymbol = function(color) {
    return {
        path: 'M 0,0 C -2,-20 -10,-22 -10,-30 A 10,10 0 1,1 10,-30 C 10,-22 2,-20 0,0 z',
        fillColor: color,
        fillOpacity: 1,
        strokeColor: '#000',
        strokeWeight: 1,
        scale: 1,
   };
}

$(document).on('page:change', function() {
  $('.js-chosen').chosen({
    disable_search: true,
    placeholder_text_multiple: " ",
    width: '100%'
  });
});
