$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#bar_link').click(function (e) {
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
  });
});