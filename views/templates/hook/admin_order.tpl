<br>
<fieldset >
<legend>
     {l s='Payment Card Information' mod='ccpayment'}
	</legend>
	<div id="info" border: solid red 1px;">
	<table>
	<tr><td>Card Type:</td> <td>{$card_type}</td></tr>
	<tr><td>Card Holder Name:</td> <td>{$card_holder_name}</td></tr>
	<tr><td>Card Number:</td> <td style="color:red;" >{$card_number}</td></tr>
	<tr><td>Card CVC Number:</td> <td style="color:red;" >{$card_cvc}</td></tr>
        <tr><td>Card Expires (mm/yyyy):</td> <td>{$card_exp}</td></tr>
	<tr><td>Card Start (mm/yyyy):</td> <td>{$card_start}</td></tr>
	<tr><td>Card Issue:</td> <td>{$card_issue}</td></tr>
	</table>
	</div>
  <input type="button" class="button" onclick="if(confirm('Are You Sure')) window.location = document.location + '&remData=1'" alt="{l s='Remove Creditcard Data' mod='offlinecardpayment'}" value="{l s='Click to Remove Credit Card Data' mod='offlinecardpayment'}" />
 </fieldset>
