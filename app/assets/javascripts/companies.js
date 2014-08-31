$(document).ready(function() {

	$(".dropdown-menu li a").click(function(){
	  var selText = $(this).text();
	  $(this).parents('.timeselect').find('.dropdown-toggle').html(selText);
	});

	$('#selected_opportunities_time').change(function(){
	    var selectboxVal = $(this).text();
	    if (selectboxVal == "Month"){
	    	alert(selectboxVal);
	    }
    });
});

