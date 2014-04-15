$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#bar_link').click(function (e) {
    $('#container4').empty();
    var url = $('#bar_link').attr('href');

    $.ajax({
        type: 'GET',
        url: url,
        success: function(data) {
          bar_data(data)
        },
        error: function(xhr, textStatus, errorThrown) {
          alert(errorThrown);
        }
    });
    e.preventDefault();

    function bar_data(bar_results) {
      $('#container4').highcharts({
          chart: {
              type: 'column'
          },
          title: {
              text: 'PotaVida Serial Data'
          },
          subtitle: {
              text: 'Source: PotaData'
          },
          xAxis: { categories:
              bar_results['xAxis']['categories']
          },
          yAxis: {
              min: 0,
              title: {
                  text: '# Times'
              }
          },
          tooltip: {
              headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
              pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                  '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
              footerFormat: '</table>',
              shared: true,
              useHTML: true
          },
          plotOptions: {
              column: {
                  pointPadding: 0.2,
                  borderWidth: 0
              }
          },
          series: bar_results['series']
      });
    }
  });
});