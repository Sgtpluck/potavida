$(document).ready(function() {
  // var button = document.querySelector('#map_link')

  $('#map_link').click(function (e) {
    $('#container4').empty();
    $("#hist_date_picker").hide();
    var url = $('#map_link').attr('href');
    function water_pins(water_data) {
      $.each(water_data["water_datum"], function( index, value ) {
        markers = handler.addMarkers([
        {
          "lat": value["lat"],
          "lng": value["long"],
          "picture": {
            "url": $('#container4').data('drop-url'),
            "width":  36,
            "height": 36
            },
          "infowindow": "Serial Number: " + value["serial"].toString() 
                                          + "<br>Cycles: " 
                                          + value["cycles"].toString()
                                          + "<br>Battery: " + value["vbatt"].toString()
          }
        ]);
      });
    }

    $.ajax({
        type: 'GET',
        url: url,
        dataType: 'json',
        success: function(data) {
          $("#container4").append("<h2 class='centered'>Disinfection Units By Location</h2><div id='map'></div>");
          if ($('#map').length) {
            handler = Gmaps.build('Google');
            handler.buildMap({ provider: {}, internal: {id:'map'}}, function(){
              water_pins(data);
              handler.bounds.extendWith(markers);
              handler.fitMapToBounds();
              handler.getMap().setZoom(13);
            });
          }
        },
        error: function(xhr, textStatus, errorThrown) {
          alert(errorThrown);
        }
    });
    e.preventDefault();
  });
});



