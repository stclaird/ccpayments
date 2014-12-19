{capture name=path}{l s='Payment'}{/capture}
<script language="javascript" src="{$this_path}views/js/jquery.validate.js"></script>
<script language="javascript" src="{$this_path}views/js/ccpayment.js"></script>
<link href="{$this_path}views/css/ccpayment.css" rel="stylesheet" type="text/css" media="all" />


<form action="{$link->getModuleLink('ccpayment', 'validation', [], true)|escape:'html'}" class="form-horizontal" id="ccpaymentForm" name="ccpaymentForm" method="post"  >
<fieldset>
<!-- Form Name -->
<legend>{l s='Please Enter Your Payment Card Details' mod='ccpayment'}</legend>
            <!-- Select Card Type -->
            <div class="control-group">
              <label class="control-label" for="card_type">{l s='Card Type' mod='ccpayment'}<em>*</em></label>
              <div class="controls">
                <select id="card_type" name="card_type" class="input-xlarge" required="" >
                  {$this_valid_card}
                </select>
              </div>
            </div>

            <!-- Card Holder Name-->
            <div class="control-group">
              <label class="control-label" for="card_holder_name">{l s='Card Holder Name' mod='ccpayment'}<em>*</em></label>
              <div class="controls">
                <input id="card_holder_name" name="card_holder_name" placeholder="{l s='Card Holder Name' mod='ccpayment'}" class="input-xlarge" required type="text">
                <p class="help-block">{l s='Enter the Card Holder Name' mod='ccpayment'}</p>
              </div>
            </div>

            <!-- Card Number-->
            <div class="control-group">
              <label class="control-label" for="card_number">{l s='Card Number' mod='ccpayment'}<em>*</em></label>
              <div class="controls">
                <input id="card_number" name="card_number" placeholder="{l s='Enter Card Number' mod='ccpayment'}" class="input-xlarge" required="" data-parsley-type="digits" type="text">
                <p class="help-block">{l s='The long number across the card' mod='ccpayment'}</p>
              </div>
            </div>

            <!-- CVV-->
            <div class="control-group">
              <label class="control-label" for="card_cvc">{l s='CVV Security Number' mod='ccpayment'}<em>*</em></label>
              <div class="controls">
                <input id="card_cvc" name="card_cvc" placeholder="{l s='CVV Security Number' mod='ccpayment'}" class=" smallnum input-small" required="" type="text">
                <p class="help-block">{l s='3 Digit Number On Back of Card' mod='ccpayment'}</p>
              </div>
            </div>

            <!-- Card Expiration Date -->
            <div class="control-group">
                <label class="control-label" for="exp_">{l s='Card Expiration Date' mod='ccpayment'}<em>*</em></label>
              <div class="controls">
                    {html_select_date 
                        prefix='exp_' 
                        start_year='-3'
                        end_year='+5' 
                        display_days=false
                        year_empty="year" 
                        class="dateselect"
                    }
              </div>
            </div>
              <hr>
            <!-- Card Start Date -->
            <div class="control-group">
                <label class="control-label" for="exp_">{l s='Card Start Date' mod='ccpayment'}</label>
              <div class="controls">
                         {html_select_date 
                                prefix='start_' 
                                start_year='-3'
                                end_year='+5' 
                                display_days=false
                                year_empty="year" 
                                class="dateselect"
                                required=""
                         }
              </div>
            </div>

            <!-- Card Issue Number -->
            <div class="control-group">
              <label class="control-label" for="cardIssue">{l s='Card Issue Number' mod='ccpayment'}</label>
              <div class="controls">
                <input id="card_issue" name="card_issue" placeholder="Issue Num" class="input-small smallnum" type="text" mod='ccpayment'>
                <p class="help-block">{l s='Enter the Card Issue Number (if it has one)' mod='ccpayment'}</p>
              </div>
            </div>
</fieldset>
        <input type="submit" value="{l s='I confirm my order' mod='ccpayment'}" class="button btn btn-default standard-checkout button-medium" />
	<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="button_large">{l s='Other payment methods' mod='ccpayment'}</a>
</form>

