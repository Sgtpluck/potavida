$(document).ready(function(){
    if ($('#hidden_form')) {
        var form = $('#hidden_form');
    }
    if ($('#sign_in')) {
        var sign_in_link = $('#sign_in');
    }
    if ($('.close')) {
        var close_button = document.querySelector('.close');
    }
    $('#sign_in').click(function (e) {
        form.show();
        sign_in_link.hide();
        var url = document.querySelector('form.sign_in_form').action
        $('.submit_sign_in').click(function (e) {
            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    'name': $('input#name').val(),
                    'password': $('input#password').val(),
                    'authenticity_token': $(".sign_in_token").html().replace(/(\r\n|\n|\r|\s)/gm,"")
                },
                success: function (data) {
                    form.hide();
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
        style.hide();
        link_style.show();
    });


});