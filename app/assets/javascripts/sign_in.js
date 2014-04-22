// $(document).ready(function(){
  
//   $('.sign_in_submit').click(function (e) {
//     var sign_in = $('.sign_in_link')
//     var url = $('form.sign_in_form').attr('action');
//         $.ajax({
//             type: 'POST',
//             url: url,
//             data: {
//                 'name': $('input#name').val(),
//                 'password': $('input#password').val(),
//                 'authenticity_token': $(".sign_in_token").html().replace(/(\r\n|\n|\r|\s)/gm,"")
//             },
//             success: function (data) {
//                 sign_in.hide();
//                 $('#myModal').modal('hide');

//             },
//             error: function(xhr, textStatus, errorThrown) {
//                 alert("There was a problem signing in.");
//             }
//         });
//         e.preventDefault();
//     });
//   });

