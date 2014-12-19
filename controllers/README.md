# Version 1.6
## Updated for Prestshop 1.6 14/12/2014

1.  Moved default views out of module root folder
  1. Created views file
  2.  Moved .tpl files to views folder
  3. Moved js / css / img to views folder

#Version 1.5
## Update for Prestastop 1.5 7/10/2012

1. Fixed 500 Error / blank Screen when submitting order

Line 148 Changed

'total_to_pay' 	=> Tools::displayPrice($params['total_to_pay'], $params['currencyObj'], false, false),

to

'total_to_pay' 	=> Tools::displayPrice($params['total_to_pay'], $params['currencyObj'], false),

