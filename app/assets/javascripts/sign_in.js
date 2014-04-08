$(document).ready(function(){
    if ($('#hidden_form')) {
        var style = $('#hidden_form');
    }
    if ($('#sign_in')) {
        var link_style = $('#sign_in');
    }
    if ($('.close')) {
        var close_button = document.querySelector('.close');
    }
    $('#sign_in').click(function (e) {
        style.show();
        link_style.hide();
        // var url = document.querySelector('form.sign_in_form').action
        // $('.submit_sign_in').click(function (e) {
        //     $.ajax({
        //         type: 'POST',
        //         url: url,
        //         data: {
        //    // serialize?
        //             'user[name]': $('#user_name').val(),
        //             'user[password]': $('#user_password').val()
        //             'authenticity_token':
        //         },
        //         success: function (data) {
        //             style.visibility = 'hidden';
        //         },
        //         error: function(xhr, textStatus, errorThrown) {
        //             alert("There was a problem signing in.");
        //             console.log(data)
        //         }
        //     });
        //     e.preventDefault();
        // });
    e.preventDefault();
  });

    $('.close').click(function (e) {
        style.hide();
        link_style.show();
    });


});