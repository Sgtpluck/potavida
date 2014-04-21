$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#batt_link').click(function (e) {
    $('#container4').empty();
    $("#hist_date_picker").hide();

    var url = $('#batt_link').attr('href');

    $.ajax({
        type: 'GET',
        url: url,
        success: function(data) {
            batt_data(data);
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
            title:{ text:
                'Battery Voltage Per Unit'},
            legend: {
            align: 'right',
            verticalAlign: 'top',
            x: -10,
            y: 50,
            floating: true
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
                 title: { text:
                    'Voltage'
                },
                labels:{
                    y:20,
                    style: {
                        fontSize:'12px',
                        fontWeight:'normal',
                        color:'#333'
                    },
                },
                lineWidth:0,
                lineColor:'#999',
                tickLength:10,
                tickColor:'#ccc',
                tickInterval: .1
            },
            yAxis:{
                title: { text:
                    'Units'
                },
                //maxPadding:0,
                gridLineColor:'#e9e9e9',
                tickWidth:1,
                tickLength:3,
                tickColor:'#ccc',
                lineColor:'#ccc',
                tickInterval:5,
                alternateGridColor: '#FDFFD5'
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