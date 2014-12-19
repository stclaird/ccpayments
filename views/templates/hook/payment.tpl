<div class="row">
    <div class="col-xs-12 col-md-6">
        <p class="payment_module">
                <a href="{$link->getModuleLink('ccpayment', 'payment')|escape:'html'}" title="{l s='Pay by Credit or Debit Card' mod='ccpayment'}">
                        <img src="{$this_path}views/img/cards.png" alt="{l s='Pay by Credit Card' mod='ccpayment'}" />
                        {l s='Pay by Credit/ Debit Card' mod='ccpayment'}&nbsp;<span>{l s='' mod='ccpayment'}</span>
                </a> 
        </p> 
    </div>
</div>