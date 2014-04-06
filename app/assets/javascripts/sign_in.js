$(document).ready(function(){
    if (document.querySelector('#hidden_form')) {
        var style = document.querySelector('#hidden_form').style;
    }
    if (document.querySelector('#sign_in')) {
        var link_style = document.querySelector('#sign_in').style;
    }
    if (document.querySelector('.close')) {
        var close_button = document.querySelector('.close');
    }
    $('#sign_in').click(function (e) {
        style.visibility = 'visible';
        link_style.visibility = 'hidden';
        var url = document.querySelector('form.sign_in_form').action
        $('.submit_sign_in').click(function (e) {
            $.ajax({
                type: 'GET',
                url: url,
                data: {
                    'user[name]': $('#user_name').val(),
                    'user[password]': $('#user_password').val()
                },
                success: function (data) {
                    style.visibility = 'hidden';
                },
                error: function(xhr, textStatus, errorThrown) {
                    alert("There was a problem signing in.");
                }
            });
            e.preventDefault();
        });
    e.preventDefault();
  });

    $('.close').click(function (e) {
        style.visibility = 'hidden';
        link_style.visibility = 'visible'
    })


});