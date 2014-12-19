$(document).ready(function(){
    
    $("#ccpaymentForm").validate({
        
         rules: {
            card_number: {
            required: true,
            creditcard: true
            },
            card_cvc: {
            required: true,
            digits: true,
            minlength: 3,
            maxlength: 3
            }
            
         }
    });
    
    
});