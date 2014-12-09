$(function() {
    $('.complete_job').hide(); 
    $('.outcome_status').change(function(){
        if($('.outcome_status').val() == 's') {
            $('.complete_job').show(); 
        } else {
            $('.complete_job').hide(); 
        } 
    });
});