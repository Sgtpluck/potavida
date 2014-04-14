$(document).ready(function() {
  // var button = document.querySelector('#map_link')

  $('#map_link').click(function (e) {
    $('#container4').empty();
    var url = $('#map_link').attr('href');
    function water_pins(water_data) {
      $.each(water_data["water_datum"], function( index, value ) {
        markers = handler.addMarkers([
        {
          "lat": value["lat"],
          "lng": value["long"],
          "picture": {
            // "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
            "width":  36,
            "height": 36
          },
          "infowindow": value["serial"]
          }
        ]);
      });
    }

    $.ajax({
        type: 'GET',
        url: url,
        dataType: 'json',
        success: function(data) {
          var water_data = data
          $("#container4").append("<div id='map'></div>");
          if ($('#map').length) {
            handler = Gmaps.build('Google');
            handler.buildMap({ provider: {}, internal: {id:'map'}}, function(){
              water_pins(data);
              handler.bounds.extendWith(markers);
              handler.fitMapToBounds();
            });
          }
        },
        error: function(xhr, textStatus, errorThrown) {
          alert(errorThrown);
        }
    });
    e.preventDefault();
  });


  // if ($('#map').length) {
  //   handler = Gmaps.build('Google');
  //   handler.buildMap({ provider: {}, internal: {id:'map'}}, function(){
  //     markers = handler.addMarkers([
  //       {
  //         "lat": 47,
  //         "lng": -122,
  //         "picture": {
  //           // "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
  //           "width":  36,
  //           "height": 36
  //         },
  //         "infowindow": "hi"
  //       }
  //     ]);
  //     handler.bounds.extendWith(markers);
  //     handler.fitMapToBounds();
  //   });  
  // }
});



