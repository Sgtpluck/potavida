$(document).ready(function(){
      if (document.querySelector('form.new_subscriber')) {
        var url = document.querySelector('form.new_subscriber').action;
      }

      $('.subscriber_submit').click(function (e) {
          $.ajax({
              type: 'POST',
              url: url,
              data: {
                  'subscriber[name]': $('#subscriber_name').val(),
                  'subscriber[email]': $('#subscriber_email').val(),
                  'authenticity_token': $(".subscriber_token").html().replace(/(\r\n|\n|\r|\s)/gm,"")
              },
              success: function (data) {
                  alert("Thanks, you've been added to the mailing list!");
                  $('#subscriber_name').val("");
                  $('#subscriber_email').val("");
              },
              error: function(xhr, textStatus, errorThrown) {
                  alert("There was a problem with your information.");
              }
          });
          e.preventDefault();
      });
  });