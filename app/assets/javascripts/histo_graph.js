$(document).ready(function() {
  // var button = document.querySelector('#bar_link')

  $('#histo_link').click(function (e) {
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
  });
});