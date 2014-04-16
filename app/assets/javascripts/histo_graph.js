$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#histo_link').click(function (e) {
    $('#container4').empty();

    var url = $('#histo_link').attr('href');

    $.ajax({
        type: 'GET',
        url: url,
        success: function() {
          console.log("The button worked")
        },
        error: function(xhr, textStatus, errorThrown) {
          alert(errorThrown);
        }
    });
    e.preventDefault();

    $(function () { 
      $('#container4').highcharts({
        chart: {
                renderTo:'container',
                defaultSeriesType:'column',
                borderWidth:0,
                backgroundColor:'#eee',
                borderWidth:1,
                borderColor:'#ccc',
                plotBackgroundColor:'#fff',
                plotBorderWidth:1,
                plotBorderColor:'#ccc'
            },
            credits:{enabled:false},
            exporting:{enabled:false},
            title:{text:'Uses per Cycle'},
            legend:{
                //enabled:false
            // },
            // tooltip:{
            //     borderWidth:1,
            //     formatter:function() {
            //         return '<b>Range:</b><br/> '+ this.x +'<br/>'+
            //         '<b>Count:</b> '+ this.y;
            //     }
            },
            plotOptions:{
                column:{
                    shadow:false,
                    borderWidth:.5,
                    borderColor:'#666',
                    pointPadding:0,
                    groupPadding:0,
                    color: '#16a085'
                },
                spline:{
                    shadow:false,
                    marker:{
                        radius:1
                    }
                },
                areaspline:{
                    color:'rgb(69, 114, 167)',
                    fillColor:'#DE4E3E',
                    shadow:false,
                    marker:{
                        radius:1
                    }
                }
            },
            xAxis:{
                title: {text: 'Uses per 20 Day Cycle'},
                labels:{
                    rotation:-90,
                    y:40,
                    style: {
                        fontSize:'8px',
                        fontWeight:'normal',
                        color:'#333'
                    },
                },
                lineWidth:0,
                lineColor:'#999',
                tickLength:70,
                tickColor:'#ccc',
                tickInterval: 7
            },
            yAxis:{
                title:{text:'People Using System'},
                //maxPadding:0,
                gridLineColor:'#e9e9e9',
                tickWidth:1,
                tickLength:3,
                tickColor:'#ccc',
                lineColor:'#ccc',
                tickInterval:25,
                //endOnTick:false,
            },
            series: [{
                name:'Times used',
                data: [4, 5, 6, 3, 4, 2, 7, 8, 4, 3, 1, 0, 9, 7, 1, 4, 1, 3, 9, 8, 5, 3],
            },{
                name:'Curve',
                type:'spline',
                visible:false,
                data: [4, 5, 6, 3, 4, 2, 7, 8, 4, 3, 1, 0, 9, 7, 1, 4, 1, 3, 9, 8, 5, 3],
                //color: 'rgba(204,204,255,.85)'
            },{
                name:'Filled Curve',
                type:'areaspline',
                visible:false,
                data: [4, 5, 6, 3, 4, 2, 7, 8, 4, 3, 1, 0, 9, 7, 1, 4, 1, 3, 9, 8, 5, 3],
                //color: 'rgba(204,204,255,.85)'
            }]
        });
    });
  });
});