$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#hist_date_submit').click(function (e) {
    $('#container4').empty();

    var url = $('#histo_date_form').attr('href');
    var begin = $('#begin_date').val() + "+10:45:44+-0700";
    var end = $('#end_date').val() + "+10:45:44+-0700";

    $.ajax({
        type: 'GET',
        data: { beginning_date: begin,
                ending_date: end
            },
        dataType: 'json',
        url: 'graphs/date_range',
        success: function(data) {
            $("#hist_date_picker").show();
            console.log(data)
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
                categories: hist_results['categories'],
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