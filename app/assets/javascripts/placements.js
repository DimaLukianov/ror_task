document.addEventListener("turbolinks:load", function() {
  var current_location;
  var lat = $('input[data-geo="lat"]').val();
  var lng = $('input[data-geo="lng"]').val();
  if(lat && lng) {
    current_location = [lat, lng];
  }
  $("#location_autocomplete").geocomplete({
    map: "#map",
    location: current_location || 'Ukraine',
    mapOptions: {
      zoom: 16
    },
    markerOptions: {
      draggable: false
    },
    details: "#placement_form",
    detailsAttribute: "data-geo"
  });
});
