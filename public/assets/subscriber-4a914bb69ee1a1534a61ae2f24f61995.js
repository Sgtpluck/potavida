$(document).ready(function(){if(document.querySelector("form.new_subscriber"))var e=document.querySelector("form.new_subscriber").action;$(".subscriber_submit").click(function(r){$.ajax({type:"POST",url:e,data:{"subscriber[name]":$("#subscriber_name").val(),"subscriber[email]":$("#subscriber_email").val(),authenticity_token:$(".subscriber_token").html().replace(/(\r\n|\n|\r|\s)/gm,"")},success:function(){alert("Thanks, you've been added to the mailing list!"),$("#subscriber_name").val(""),$("#subscriber_email").val("")},error:function(){alert("There was a problem with your information."),console.log(data)}}),r.preventDefault()})});