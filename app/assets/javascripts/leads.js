$(document).ready(function() {

	$(".dropdown a").click(function(){
	  var selText = $(this).text();
	  $(this).parents('.timeselect').find('.dropdown-toggle').html(selText);
	});
});

 $(function() {
    $( ".datepicker" ).datepicker();
  });