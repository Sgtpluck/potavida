$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#bar_link').click(function (e) {
    $('#container4').empty();
    var url = $('#bar_link').attr('href');

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
            type: 'bar',
            inverted: true
        },
        title: {
            text: 'Da Infomation'
        },
        xAxis: {
            categories: ['Apples', 'Bananas', 'Oranges']
        },
        yAxis: {
            title: {
                text: 'Fruit eaten'
            }
        },
        series: [{
            name: 'Jane',
            data: [1, 0, 4]
        }, {
            name: 'John',
            data: [5, 7, 3]
        }, {
            name: 'Davida',
            data: [7, 3, 1]
        }]
      });
    });
  });
});