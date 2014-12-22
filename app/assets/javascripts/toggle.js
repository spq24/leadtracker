$(document).ready(function() {
    $('.call_answered_false').change(function(){

    var radiobtnfalseVal = $(this).val()
    if (radiobtnfalseVal == "false"){
        $('#why_not_answered').show();
        $('#q_opportunity').show();
    }
    });

    $('.call_answered_true').change(function(){

    var radiobtntrueVal = $(this).val()
    if (radiobtntrueVal == "true"){
        $('#q_opportunity').show();
        $('#why_not_answered').hide();
    }
    });

    $('.opportunity_true').change(function(){

    var opportunitytrueVal = $(this).val()
    if (opportunitytrueVal == "true"){
        $('#opportunity_type').show();
        $('#reason_for_call').show();
        $('#inquiry_type_mail').show();
        $('#lead').show();
        $('#non_opportunity_type').hide();
        $('#q_spam_mail').hide();
    }
    });

    $('.opportunity_false').change(function(){

    var opportunityfalseVal = $(this).val()
    if (opportunityfalseVal == "false"){
        $('#non_opportunity_type').show();
        $('#q_spam_mail').show();
        $('#opportunity_type').hide();
        $('#reason_for_call').hide();
        $('#inquiry_type_mail').hide();
    }
    });
 });