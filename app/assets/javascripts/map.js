$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#map_link').click(function (e) {
    var url = $('#map_link').attr('href');

    $.ajax({
        type: 'GET',
        url: url, format: 'js',
        success: function() {
          console.log("The button worked")
        },
        error: function(xhr, textStatus, errorThrown) {
          alert(errorThrown);
        }
    });
    e.preventDefault();
  });

  if ($('#map').length) {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id:'map'}}, function(){
      markers = handler.addMarkers([
        {
          "lat": 47,
          "lng": -122,
          "picture": {
            // "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
            "width":  36,
            "height": 36
          },
          "infowindow": "hi"
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });  
  }
});



