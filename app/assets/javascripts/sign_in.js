$(document).ready(function(){
    if (document.querySelector('#hidden_form')) {
        var style = document.querySelector('#hidden_form').style;
    }
    if (document.querySelector('#sign_in')) {
        var link_style = document.querySelector('#sign_in').style;
    }
    $('#sign_in').click(function (e) {
        style.visibility = 'visible';
        link_style.visibility = 'hidden';
      

    // $.ajax({
    //     type: 'PATCH',
    //     url: url,
    //     data: {
    //         'user[email]': $('#user_email').val(),
    //         'user[phone]': $('#user_phone').val()
    //     },
    //     success: function (data) {
    //         $('#myModal').foundation('reveal', 'close');
    //     },
    //     error: function(xhr, textStatus, errorThrown) {
    //         alert("There was a problem updating this item.");
    //     }
    // });
    e.preventDefault();
  });

});