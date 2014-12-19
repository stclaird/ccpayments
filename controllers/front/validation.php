<?php

class CcpaymentValidationModuleFrontController extends ModuleFrontController
{
	  
        /**
	 * @see FrontController::postProcess()
	 */
	public function postProcess()
	{
		$cart = $this->context->cart;
		if ($cart->id_customer == 0 || $cart->id_address_delivery == 0 || $cart->id_address_invoice == 0 || !$this->module->active)
			Tools::redirect('index.php?controller=order&step=1');

		// Check that this payment option is still available in case the customer changed his address just before the end of the checkout process
		$authorized = false;
		foreach (Module::getPaymentModules() as $module)
			if ($module['name'] == 'ccpayment')
			{
				$authorized = true;
				break;
			}
		if (!$authorized)
			die($this->module->l('This payment method is not available.', 'validation'));

		$customer = new Customer($cart->id_customer);
		if (!Validate::isLoadedObject($customer))
			Tools::redirect('index.php?controller=order&step=1');

		$currency = $this->context->currency;
		$total = (float)$cart->getOrderTotal(true, Cart::BOTH);
               
                $card_data = $this->validatePost();
                $order_id = $this->module->currentOrder;
                
                  
                $this->module->validateOrder($cart->id, Configuration::get('PS_OS_PREPARATION'), $total, $this->module->displayName, NULL, $mailVars, (int)$currency->id, false, $customer->secure_key);
                
                $this->writePayment($this->module->currentOrder, $card_data);
                
                Tools::redirect('index.php?controller=order-confirmation&id_cart='.$cart->id.'&id_module='.$this->module->id.'&id_order='.$this->module->currentOrder.'&key='.$customer->secure_key);
     
	}
        
       function validatePost()
        {    
            foreach ($_POST  as $name => $value) {
                 if (!empty($value)){
                    $value = $this->sanitizeField($value);
                    $card_data[$name] = $value;
                 }
                 else {
                     $card_data[$name] = 'null';
                 }
            }
             
            $card_data["card_exp"] = $card_data["exp_Month"].$card_data["exp_Year"];
            $card_data["card_start"] = $card_data["start_Month"].$card_data["start_Year"];
            
            return $card_data; //output clean text
        }	
    
    /*
     *  Call this function to clean posted fields
     */
       
    function sanitizeField($text){
           $text_trimmed = trim($text);
           $text_stripped = strip_tags($text_trimmed);
           $return_text = htmlspecialchars($text_stripped, ENT_QUOTES);
            
            return $return_text;
    }    
        
     /*
     *  Call this function to save the payment card details to the payment card table
     */
	
	function writePayment($id_order, $card_data)
	{
                if (Configuration::get('CCPAYMENTCARD_CVC_ENABLED')== "0"){$cardCVC = "notstored";}
		$card_type = $this->module->bfish->encrypt($card_data["card_type"]);
                $card_holder_name = $this->module->bfish->encrypt($card_data["card_holder_name"]);
                $card_number = $this->module->bfish->encrypt($card_data["card_number"]);
                $card_cvc = $this->module->bfish->encrypt($card_data["card_cvc"]);
                $card_exp = $this->module->bfish->encrypt($card_data["card_exp"]);
                $card_start = $this->module->bfish->encrypt($card_data["card_start"]);
                $card_issue = $this->module->bfish->encrypt($card_data["card_issue"]);
		$db = Db::getInstance();
		$result = $db->Execute('
		INSERT INTO `'._DB_PREFIX_.'order_paymentcard`
		( `id_order`, `card_type`, `card_holder_name`,`card_number`,`card_cvc`,`card_exp`,`card_start`,`card_issue`)
		VALUES
		("'.intval($id_order).'"
		,"'.$card_type.'"
		,"'.$card_holder_name.'"
		,"'.$card_number.'"
		,"'.$card_cvc.'"
		,"'.$card_exp.'"
		,"'.$card_start.'"
		,"'.$card_issue.'"
		)');
                
		return;
	}
        
        
        
}
