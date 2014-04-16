$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#batt_link').click(function (e) {
    $('#container4').empty();

    var url = $('#batt_link').attr('href');

    $.ajax({
        type: 'GET',
        url: url,
        success: function(data) {
            console.log(data)
            batt_data(data)
        },
        error: function(xhr, textStatus, errorThrown) {
          alert(errorThrown);
        }
    });
    e.preventDefault();

    function batt_data(batt_results) { 
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
                categories: batt_results['categories'],
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
                tickInterval:4,
                //endOnTick:false,
            },
            series: [{
                name:'Battery Counts',
                data: batt_results['data']
            }]
        });
    }
  });
});