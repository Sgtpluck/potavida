$(document).ready(function(){$("#bar_link").click(function(n){var e=$("#bar_link").attr("href");$.ajax({type:"GET",url:e,success:function(){console.log("The button worked")},error:function(n,e,r){alert(r)}}),n.preventDefault()})});