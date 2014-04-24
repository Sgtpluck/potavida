$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#histo_link').click(function (e) {
    $('#container4').empty();

    var url = $('#histo_link').attr('href');

    $.ajax({
        type: 'GET',
        url: url,
        success: function(data) {
            $("#hist_date_picker").show();
            hist_data(data);
        },
        error: function(xhr, textStatus, errorThrown) {
          alert(errorThrown);
        }
    });
    e.preventDefault();

    function hist_data(hist_results) { 
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
                'Total Successful Disinfection Cycles' },
            legend: {
            align: 'right',
            verticalAlign: 'top',
            x: -10,
            y: 50,
            floating: true
            },
            tooltip:{
                borderWidth:1,
                formatter:function() {
                    return '<b>Range:</b><br/> '+ this.x +'<br/>'+
                    '<b>Count:</b> '+ this.y;
                }
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
                title: { text:
                        'Total Successful Cycles'
                    },
                categories: hist_results['categories'],
                labels:{
                    y:10,
                    style: {
                        fontSize:'8px',
                        fontWeight:'normal',
                        color:'#333'
                    },
                },
                lineWidth:0,
                lineColor:'#999',
                tickLength:10,
                tickColor:'#ccc',
                tickInterval: 1
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
                tickInterval:2,
                //endOnTick:false,
            },
            series: [{
                name:'Times used',
                data: hist_results['data']
            },{
                name:'Curve',
                type:'spline',
                visible:false,
                data: hist_results['data']                
                //color: 'rgba(204,204,255,.85)'
            },{
                name:'Filled Curve',
                type:'areaspline',
                visible:false,
                data: hist_results['data']
                //color: 'rgba(204,204,255,.85)'
            }]
        });
    }
  });
});