$(document).ready(function(){$("#map_link").click(function(n){function a(n){$.each(n.water_datum,function(n,a){markers=handler.addMarkers([{lat:a.lat,lng:a["long"],picture:{width:36,height:36},infowindow:a.serial}])})}$("#container4").empty();var e=$("#map_link").attr("href");$.ajax({type:"GET",url:e,dataType:"json",success:function(n){$("#container4").append("<div id='map'></div>"),$("#map").length&&(handler=Gmaps.build("Google"),handler.buildMap({provider:{},internal:{id:"map"}},function(){a(n),handler.bounds.extendWith(markers),handler.fitMapToBounds(),handler.getMap().setZoom(13)}))},error:function(n,a,e){alert(e)}}),n.preventDefault()})});