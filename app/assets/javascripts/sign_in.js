$(document).ready(function(){
    var style = document.querySelector('#hidden_form').style;
    var link_style = document.querySelector('#sign_in').style;
    $('#sign_in').click(function (e) {
        style.visibility = 'visible';
        link_style.visibility = 'hidden';

    // var url = $('form.edit_user').attr('action');

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