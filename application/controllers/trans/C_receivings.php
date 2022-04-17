<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_receivings extends MY_Controller{
    
    public function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    }
    
    public function index($purchaseType = '')
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        //$this->output->enable_profiler();
        
        $data['title'] = 'Purchase';
        $data['main'] = 'Purchase';
        
        $data['purchaseType'] = $purchaseType;
        //when click on sale manu clear the cart first if exist
        //$this->destroyCart();
        
        //$data['itemDDL'] = $this->M_items->getItemDropDown();
        //$data['emp_DDL'] = $this->M_employees->getEmployeeDropDown();
        $data['sizesDDL'] = $this->M_sizes->get_activeSizesDDL();
        $data['supplierDDL'] = $this->M_suppliers->getSupplierDropDown();//search for legder account
        //$data['currencyDropDown'] = $this->M_currencies->getcurrencyDropDown();
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/receivings/v_purchases',$data);
        $this->load->view('templates/footer');
    }
    
    public function editPurchase($receiving_id)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'Edit Purchase';
        $data['main'] = 'Edit Purchase';
        
        $data['purchaseType'] = '';//$saleType;//CASH, CREDIT, CASH RETURN AND CREDIT RETURN
        $data['invoice_no'] = $receiving_id;
        $data['receiving_id'] = $receiving_id;
        $data['edit'] = true;
        
        //$data['itemDDL'] = $this->M_items->get_allItemsforJSON();
        $data['supplierDDL'] = $this->M_suppliers->getSupplierDropDown();
        $data['supplier_cust'] = $this->M_suppliers->get_cust_supp();
        //$data['emp_DDL'] = $this->M_employees->getEmployeeDropDown();
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/receivings/v_editpurchases',$data);
        $this->load->view('templates/footer');
    }
    
    //purchase the projuct angularjs
    public function purchaseProducts()
    {
        //INITIALIZE
        $total_amount =0;
        $discount =0;
        $amount=0;
        
        // get posted data from angularjs purchases 
        $data_posted = json_decode(file_get_contents("php://input",true)); 
        
        //print_r($data_posted);
        
            //GET PREVIOISE INVOICE NO  
        //   @$prev_invoice_no = $this->M_receivings->getMAXPurchaseInvoiceNo();
        //   $number = (int) substr($prev_invoice_no,2)+1; // EXTRACT THE LAST NO AND INCREMENT BY 1
        //   $new_invoice_no = 'PO'.$number;
           
        if(count((array)$data_posted) > 0)
        { 
            $this->db->trans_complete();  
            
            $narration = ($data_posted->description == '' ? '' : $data_posted->description);
            $sale_date = date('Y-m-d',strtotime($data_posted->sale_date));
            $discount = ($data_posted->discount == '' ? 0 : $data_posted->discount);
            $exchange_rate = ($data_posted->exchange_rate == '' ? 0 : $data_posted->exchange_rate);
            $currency_id = ($data_posted->currency_id == '' ? 0 : $data_posted->currency_id);
            $emp_id=0;
            $total_tax_amount =  $data_posted->total_tax;
            $register_mode='receive';
            $narration = $data_posted->description;
            $shipping = $data_posted->shipping;
            $payment_status = $data_posted->payment_status;
            $delivery_status = $data_posted->delivery_status;
            $new_invoice_no = $data_posted->supplier_invoice_no;
            $coa=($data_posted->coa == '' ? 0 : $data_posted->coa);
            $msds=($data_posted->msds == '' ? 0 : $data_posted->msds);
            $flowchart=($data_posted->flowchart == '' ? 0 : $data_posted->flowchart);
            $forme=($data_posted->forme == '' ? 0 : $data_posted->forme);
            $halal=($data_posted->halal == '' ? 0 : $data_posted->halal);
            $eta = ($data_posted->eta == '' ? 0 : $data_posted->eta);
            $etd = ($data_posted->etd == '' ? 0 : $data_posted->etd);
            $awb = ($data_posted->awb == '' ? 0 : $data_posted->awb);
            $quotation = $data_posted->quotation;
            $shipping_cost = $data_posted->shipping_cost;
            $delivery_date = $data_posted->delivery_date;
            
            //GET ALL ACCOUNT CODE WHICH IS TO BE POSTED AMOUNT
            $supplier_id =$data_posted->supplier_id;
            $posting_type_code = $this->M_suppliers->getSupplierPostingTypes($supplier_id);
            
           
                $total_amount =  round(($data_posted->total_amount-$discount),2);
                $total_return_amount =  round(($data_posted->total_amount-$discount),2);//FOR RETURN PURSPOSE
           
            /////
        
        // if(count($posting_type_code) !== 0)
        // {
         $data = array(
            'company_id'=> $_SESSION['company_id'],
            'invoice_no' => $new_invoice_no,
            'supplier_id' => $data_posted->supplier_id,
            'supplier_invoice_no' => $data_posted->supplier_invoice_no,
            'employee_id'=>$emp_id,
            'user_id'=>$_SESSION['user_id'],
            'receiving_date' => $sale_date,
            'register_mode'=>$register_mode,
            'account'=>$data_posted->purchaseType,
            'amount_due'=>$data_posted->amount_due,
            'description'=>$narration,
            'discount_value'=>$discount,
            'currency_id'=>$currency_id,
            'exchange_rate'=>$exchange_rate,
            'total_amount'=>$total_amount,
            'total_tax'=>$total_tax_amount,
            'shipping'=>$shipping,
            'payment_status'=>$payment_status,
            'delivery_status'=>$delivery_status,
            'coa'=>$coa,
            'msds'=>$msds,
            'flowchart'=>$flowchart,
            'forme'=>$forme,
            'halal'=>$halal,
            'eta'=>$eta,
            'etd'=>$etd,
            'awb'=>$awb,
            'quotation'=>$quotation,
            'shipping_cost'=>$shipping_cost,
            'delivery_date'=>$delivery_date,
            
            );
            
        $this->db->insert('pos_receivings', $data);
        
        $receiving_id = $this->db->insert_id();
        
        $inventory_acc_code = array();
        //extract JSON array items from posted data.
        foreach($data_posted->items as $posted_values):
        
            $service = ($posted_values->service == null ? 0 : $posted_values->service);
            //$posted_exp_date = strftime('%Y-%m-%d', strtotime($posted_values->expiry_date));//get only date remove time
            
            //insert in receivings items
            $data = array(
                'receiving_id'=>$receiving_id,
                'invoice_no' => $new_invoice_no,
                'item_id'=>$posted_values->item_id,
                'quantity_purchased'=>($register_mode == 'receive' ? $posted_values->quantity : -$posted_values->quantity),//if purchase return then insert amount in negative
                'item_cost_price'=>($register_mode == 'receive' ? $posted_values->cost_price : -$posted_values->cost_price),//actually its avg cost comming from sale from
                'item_unit_price'=>($register_mode == 'receive' ? $posted_values->unit_price : -$posted_values->unit_price),//if purchase return then insert amount in negative
                //'discount_percent'=>$posted_values->discount,
                'color_id'=>0,
                'size_id'=>$posted_values->size_id,
                'company_id'=> $_SESSION['company_id'],
                'unit_id'=>$posted_values->unit_id,
                'tax_id'=>$posted_values->tax_id,
                'tax_rate'=>$posted_values->tax_rate,
                'service'=>$service,
                
            );
                
            $this->db->insert('pos_receivings_items', $data);
            // receiving itmes
            
                    //for logging
                    $msg = 'invoice no '. $new_invoice_no;
                    $this->M_logs->add_log($msg,"purchase transaction","created","trans");
                    // end logging
                    
            //insert items details
            //if items already exist according to expiry then update qty.
            if($this->M_items->checkItemOptions($posted_values->item_id,0,$posted_values->size_id))
            {
                $total_stock =  $this->M_items->total_stock($posted_values->item_id,0,$posted_values->size_id);
                        
                        //if products is to be return then it will subtract from qty and the avg cost will be reverse to original cost
                        if($service != 1)
                        {
                            if($data_posted->register_mode == 'return')
                            {
                                $quantity = ($total_stock - $posted_values->quantity);
                            }else {
                                $quantity=($total_stock + $posted_values->quantity); 
                            }

                        }else{
                            $quantity = 0;
                        }
                        
                 
                $option_data = array(
                'quantity'=>$quantity,
                'unit_price' =>$posted_values->unit_price,
                'avg_cost'=>$this->M_items->getAvgCost($posted_values->item_id,$posted_values->cost_price,$posted_values->quantity,0,$posted_values->size_id,$register_mode)//calculate avg cost
                 
                );
              $this->db->update('pos_items_detail',$option_data,array('color_id'=>0,'size_id'=>$posted_values->size_id,'item_id'=>$posted_values->item_id));
         
            }
            //item details
            
            //insert item info into inventory table
            $data1= array(
                
                'trans_item'=>$posted_values->item_id,
                'trans_comment'=>'KSRECV',
                'trans_inventory' =>$posted_values->quantity,
                'company_id'=> $_SESSION['company_id'],
                'trans_user'=>$_SESSION['user_id'],
                'invoice_no' => $new_invoice_no,
                'cost_price'=>$posted_values->cost_price,
                'unit_price'=>$posted_values->unit_price,
                'delivery_date'=>$delivery_date,
                'currency_id'=>$currency_id,
                );
                
            $this->db->insert('pos_inventory', $data1);
            //insert item info into inventory table  
            
            $amount += ($posted_values->quantity * $posted_values->cost_price);
                
            //ADD INVENTORY AMOUNT WHICH IS SELECTED IN ITEM
            @$inventory_acc_code[$posted_values->inventory_acc_code] += $posted_values->cost_price;
          
          
        endforeach;
        
        //total net amount 
        //$total_amount =  round(($amount-$discount)-$data_posted->amount_due,2);
        
               
               $this->db->trans_complete();
               
               
               echo '{"invoice_no":"'.$new_invoice_no.'"}';//redirect to receipt page using this $new_invoice_no 
         
                 
         ////////////////////////////
         //      ACCOUNTS CLOSED ..///
         
        // }// Posting type  end if 
        // else{
        //     echo '{"invoice_no":"no-posting-type"}';
        // }
        
        }///$data_posted if close
        else{
            echo 'No Data';
        }
    }
    
    //purchase the projuct angularjs
    public function editpurchaseProducts()
    {
        //INITIALIZE
        $total_amount =0;
        $discount =0;
        $amount=0;
        
        // get posted data from angularjs purchases 
        $data_posted = json_decode(file_get_contents("php://input",true)); 
        
        // var_dump($_POST);
        // print_r($data_posted);
        // die;
            //GET PREVIOISE INVOICE NO  
        //   @$prev_invoice_no = $this->M_receivings->getMAXPurchaseInvoiceNo();
        //   $number = (int) substr($prev_invoice_no,2)+1; // EXTRACT THE LAST NO AND INCREMENT BY 1
        //   $new_invoice_no = 'PO'.$number;
           
        if(count((array)$data_posted) > 0)
        { 
            $this->db->trans_complete();  
            $invoice_no=$data_posted->invoice_no;
            $receiving_id1 = $data_posted->receiving_id;
            $narration = ($data_posted->description == '' ? '' : $data_posted->description);
            $sale_date = date('Y-m-d',strtotime($data_posted->sale_date));
            $discount = ($data_posted->discount == '' ? 0 : $data_posted->discount);
            $exchange_rate = ($data_posted->exchange_rate == '' ? 0 : $data_posted->exchange_rate);
            $currency_id = ($data_posted->currency_id == '' ? 0 : $data_posted->currency_id);
            $emp_id=0;
            $total_tax_amount =  '';
            $register_mode='receive';
            $narration = $data_posted->description;
            $shipping = $data_posted->shipping;
            $payment_status = $data_posted->payment_status;
            $delivery_status = $data_posted->delivery_status;
            $new_invoice_no = $data_posted->supplier_invoice_no;
            $coa=($data_posted->coa == '' ? 0 : $data_posted->coa);
            $msds=($data_posted->msds == '' ? 0 : $data_posted->msds);
            $flowchart=($data_posted->flowchart == '' ? 0 : $data_posted->flowchart);
            $forme=($data_posted->forme == '' ? 0 : $data_posted->forme);
            $halal=($data_posted->halal == '' ? 0 : $data_posted->halal);
            $eta = $data_posted->eta;
            $etd = $data_posted->etd;
            $awb = $data_posted->awb;
            $quotation = $data_posted->quotation;
            $shipping_cost = $data_posted->shipping_cost;
            $delivery_date = $data_posted->delivery_date;
            
            //GET ALL ACCOUNT CODE WHICH IS TO BE POSTED AMOUNT
            $supplier_id =$data_posted->supplier_id;
            $posting_type_code = $this->M_suppliers->getSupplierPostingTypes($supplier_id);
            
           
                $total_amount =  round(($data_posted->total_amount-$discount),2);
                $total_return_amount =  round(($data_posted->total_amount-$discount),2);//FOR RETURN PURSPOSE
           
            /////
        
        // if(count($posting_type_code) !== 0)
        // {
            $this->delete_by_receiving_id($receiving_id1,$invoice_no,'edit');
            
         $data = array(
            'company_id'=> $_SESSION['company_id'],
            'invoice_no' => $data_posted->supplier_invoice_no,
            'supplier_id' => $data_posted->supplier_id,
            'supplier_invoice_no' => $data_posted->supplier_invoice_no,
            'employee_id'=>$emp_id,
            'user_id'=>$_SESSION['user_id'],
            'receiving_date' => $sale_date,
            'register_mode'=>$register_mode,
            'account'=>$data_posted->purchaseType,
            'amount_due'=>$data_posted->amount_due,
            'description'=>$narration,
            'discount_value'=>$discount,
            'currency_id'=>$currency_id,
            'exchange_rate'=>$exchange_rate,
            'total_amount'=>$total_amount,
            'total_tax'=>$total_tax_amount,
            'shipping'=>$shipping,
            'payment_status'=>$payment_status,
            'delivery_status'=>$delivery_status,
            'coa'=>$coa,
            'msds'=>$msds,
            'flowchart'=>$flowchart,
            'forme'=>$forme,
            'halal'=>$halal,
            'eta' => $eta,
            'etd' => $etd,
            'awb' => $awb,
            'quotation' => $quotation,
            'shipping_cost' => $shipping_cost,
            'delivery_date'=>$delivery_date,
            
            );
            
        $this->db->insert('pos_receivings', $data);
        
        $receiving_id = $this->db->insert_id();
        
        $inventory_acc_code = array();
        //extract JSON array items from posted data.
        foreach($data_posted->items as $posted_values):
        
            $service = ($posted_values->service == null ? 0 : $posted_values->service);
            //$posted_exp_date = strftime('%Y-%m-%d', strtotime($posted_values->expiry_date));//get only date remove time
            
            //insert in receivings items
            $data = array(
                'receiving_id'=>$receiving_id,
                'invoice_no' => $new_invoice_no,
                'item_id'=>$posted_values->item_id,
                'quantity_purchased'=>($register_mode == 'receive' ? $posted_values->quantity : -$posted_values->quantity),//if purchase return then insert amount in negative
                'item_cost_price'=>($register_mode == 'receive' ? $posted_values->cost_price : -$posted_values->cost_price),//actually its avg cost comming from sale from
                'item_unit_price'=>($register_mode == 'receive' ? $posted_values->unit_price : -$posted_values->unit_price),//if purchase return then insert amount in negative
                //'discount_percent'=>$posted_values->discount,
                //'color_id'=>0,
                'size_id'=>$posted_values->size_id,
                'company_id'=> $_SESSION['company_id'],
                'unit_id'=>$posted_values->unit_id,
                'tax_id'=>$posted_values->tax_id,
                'tax_rate'=>$posted_values->tax_rate,
                'service'=>$service,
                
            );
                
            $this->db->insert('pos_receivings_items', $data);
            // receiving itmes
            
                    //for logging
                    $msg = 'invoice no '. $new_invoice_no;
                    $this->M_logs->add_log($msg,"purchase transaction","created","trans");
                    // end logging
                    
            //insert items details
            //if items already exist according to expiry then update qty.
            if($this->M_items->checkItemOptions($posted_values->item_id,0,$posted_values->size_id))
            {
                $total_stock =  $this->M_items->total_stock($posted_values->item_id,0,$posted_values->size_id);
                        
                        //if products is to be return then it will subtract from qty and the avg cost will be reverse to original cost
                        if($service != 1)
                        {
                            if($register_mode == 'return')
                            {
                                $quantity = ($total_stock - $posted_values->quantity);
                            }else {
                                $quantity=($total_stock + $posted_values->quantity); 
                            }

                        }else{
                            $quantity = 0;
                        }
                        
                 
                $option_data = array(
                'quantity'=>$quantity,
                'unit_price' =>$posted_values->unit_price,
                'avg_cost'=>$this->M_items->getAvgCost($posted_values->item_id,$posted_values->cost_price,$posted_values->quantity,0,$posted_values->size_id,$register_mode)//calculate avg cost
                 
                );
              $this->db->update('pos_items_detail',$option_data,array('color_id'=>0,'size_id'=>$posted_values->size_id,'item_id'=>$posted_values->item_id));
         
            }
            //item details
            
            //insert item info into inventory table
            $data1= array(
                
                'trans_item'=>$posted_values->item_id,
                'trans_comment'=>'KSRECV',
                'trans_inventory' =>$posted_values->quantity,
                'company_id'=> $_SESSION['company_id'],
                'trans_user'=>$_SESSION['user_id'],
                'invoice_no' => $new_invoice_no,
                'cost_price'=>$posted_values->cost_price,
                'unit_price'=>$posted_values->unit_price,
                'delivery_date'=>$delivery_date,
                'currency_id'=>$currency_id,
                );
                
            $this->db->insert('pos_inventory', $data1);
            //insert item info into inventory table  
            
            $amount += ($posted_values->quantity * $posted_values->cost_price);
                
            //ADD INVENTORY AMOUNT WHICH IS SELECTED IN ITEM
            @$inventory_acc_code[$posted_values->inventory_acc_code] += $posted_values->cost_price;
          
          
        endforeach;
        
        
        // }// Posting type  end if 
        // else{
        //     echo '{"invoice_no":"no-posting-type"}';
        // }
        
        }///$data_posted if close
        else{
            echo 'No Data';
        }
    }
    //purchase the projuct angularjs
    public function editpurchaseProducts_jquery()
    {
        //INITIALIZE
        $total_amount =0;
        $discount =0;
        $amount=0;
        $fan_file_name="";
        $ssdt_file_name="";
        $supplier_pi_file_name="";
        $quotation_file = "";
        
        //var_dump($_POST);
        //var_dump($_FILES['fan']);
        
        if (isset($_FILES['fan']) && $_FILES['fan']['error'] == 0) {

        // uploads image in the folder images
            $temp = explode(".", $_FILES["fan"]["name"]);
            $newfilename = substr(md5(time()), 0, 10) . '.' . end($temp);
            move_uploaded_file($_FILES['fan']['tmp_name'], 'images/fan/' . $newfilename);
            $fan_file_name = $newfilename;
        }
        
        if (isset($_FILES['ssdt']) && $_FILES['ssdt']['error'] == 0) {

        // uploads image in the folder images
            $temp = explode(".", $_FILES["ssdt"]["name"]);
            $newfilename = substr(md5(time()), 1, 10) . '.' . end($temp);
            move_uploaded_file($_FILES['ssdt']['tmp_name'], 'images/ssdt/' . $newfilename);
            $ssdt_file_name = $newfilename;
        }
        
        if (isset($_FILES['supplier_pi']) && $_FILES['supplier_pi']['error'] == 0) {

        // uploads image in the folder images
            $temp = explode(".", $_FILES["supplier_pi"]["name"]);
            $newfilename = substr(md5(time()), 2, 10) . '.' . end($temp);
            move_uploaded_file($_FILES['supplier_pi']['tmp_name'], 'images/supplier_pi/' . $newfilename);
            $supplier_pi_file_name = $newfilename;
        }
        
        if (isset($_FILES['quotation_file']) && $_FILES['quotation_file']['error'] == 0) {

        // uploads image in the folder images
            $temp = explode(".", $_FILES["quotation_file"]["name"]);
            $newfilename = substr(md5(time()), 3, 10) . '.' . end($temp);
            move_uploaded_file($_FILES['quotation_file']['tmp_name'], 'images/quotation/' . $newfilename);
            $quotation_file_name = $newfilename;
        }
       
        
            //GET PREVIOISE INVOICE NO  
        //   @$prev_invoice_no = $this->M_receivings->getMAXPurchaseInvoiceNo();
        //   $number = (int) substr($prev_invoice_no,2)+1; // EXTRACT THE LAST NO AND INCREMENT BY 1
        //   $new_invoice_no = 'PO'.$number;
           
        if(count((array)$_POST) > 0)
        { 
            $this->db->trans_complete();  
            $invoice_no=$this->input->post('supplier_invoice_no');
            $receiving_id1 = $this->input->post('receiving_id');
            $narration = ($this->input->post('description') == '' ? '' : $this->input->post('description'));
            $sale_date = date('Y-m-d',strtotime($this->input->post('receiving_date')));
            $discount = ($this->input->post('discount') == '' ? 0 : $this->input->post('discount'));
            $exchange_rate = ($this->input->post('exchange_rate') == '' ? 0 : $this->input->post('exchange_rate'));
            $currency_id = ($this->input->post('currency_id') == '' ? 0 : $this->input->post('currency_id'));
            $emp_id=0;
            $total_tax_amount =  '';
            $register_mode='receive';
            $narration = $this->input->post('description');
            $shipping = $this->input->post('shipping');
            $payment_status = $this->input->post('payment_status');
            $delivery_status = $this->input->post('delivery_status');
            $new_invoice_no = $this->input->post('supplier_invoice_no');
            $coa=($this->input->post('coa') == '' ? 0 : $this->input->post('coa'));
            $msds=($this->input->post('msds') == '' ? 0 : $this->input->post('msds'));
            $flowchart=($this->input->post('flowchart') == '' ? 0 : $this->input->post('flowchart'));
            $forme=($this->input->post('forme') == '' ? 0 : $this->input->post('forme'));
            $halal=($this->input->post('halal') == '' ? 0 : $this->input->post('halal'));
            $eta = $this->input->post('eta');
            $etd = $this->input->post('etd');
            $awb = $this->input->post('awb');
            $quotation = $this->input->post('quotation');
            $shipping_cost = $this->input->post('shipping_cost');
            $delivery_date = $this->input->post('delivery_date');
            $payment_date = $this->input->post('payment_date');
            
            //GET ALL ACCOUNT CODE WHICH IS TO BE POSTED AMOUNT
            $supplier_id =$this->input->post('supplier_id');
            $posting_type_code = $this->M_suppliers->getSupplierPostingTypes($supplier_id);
            
           
                $total_amount =  round(($this->input->post('total_amount')-$discount),2);
                $total_return_amount =  round(($this->input->post('total_amount')-$discount),2);//FOR RETURN PURSPOSE
           
            /////
        
        // if(count($posting_type_code) !== 0)
        // {
        
        $this->delete_by_receiving_id($receiving_id1,$invoice_no,'edit');
            
         $data = array(
            'receiving_id'=>$receiving_id1,
            'company_id'=> $_SESSION['company_id'],
            'invoice_no' => $this->input->post('supplier_invoice_no'),
            'supplier_id' => $this->input->post('supplier_id'),
            'supplier_invoice_no' => $this->input->post('supplier_invoice_no'),
            'employee_id'=>$emp_id,
            'user_id'=>$_SESSION['user_id'],
            'receiving_date' => $sale_date,
            'register_mode'=>$register_mode,
            'account'=>$this->input->post('purchaseType'),
            'amount_due'=>0,
            'description'=>$narration,
            'discount_value'=>$discount,
            'currency_id'=>$currency_id,
            'exchange_rate'=>$exchange_rate,
            'total_amount'=>$total_amount,
            'total_tax'=>$total_tax_amount,
            'shipping'=>$shipping,
            'payment_status'=>$payment_status,
            'delivery_status'=>$delivery_status,
            'coa'=>$coa,
            'msds'=>$msds,
            'flowchart'=>$flowchart,
            'forme'=>$forme,
            'halal'=>$halal,
            'eta' => $eta,
            'etd' => $etd,
            'awb' => $awb,
            'quotation' => $quotation,
            'shipping_cost' => $shipping_cost,
            'delivery_date'=>$delivery_date,
            'payment_date'=>$payment_date,
            'fan'=>$fan_file_name,
            'ssdt'=>$ssdt_file_name,
            'supplier_pi'=>$supplier_pi_file_name,
            'quotation_file'=>$quotation_file_name,
            );
            
        $this->db->insert('pos_receivings', $data);
        
        $receiving_id = $this->db->insert_id();
        
        $item_id = $this->input->post('item_id');
        $quantity = $this->input->post('quantity');
        $cost_price = $this->input->post('cost_price');
        $unit_price = 0; //(count($this->input->post('unit_price')) > 0 ? $this->input->post('unit_price') : 0);
        $unit_id = $this->input->post('unit_id');
        
        $inventory_acc_code = array();
        //extract JSON array items from posted data.
        foreach($item_id as $key => $value):
        
            $service = ($this->input->post('service')[$key] == null ? 0 : $this->input->post('service')[$key]);
            //$posted_exp_date = strftime('%Y-%m-%d', strtotime($posted_values->expiry_date));//get only date remove time
            
            //insert in receivings items
            $data = array(
                'receiving_id'=>$receiving_id,
                'invoice_no' => $new_invoice_no,
                'item_id'=>$item_id[$key],
                'quantity_purchased'=>($register_mode == 'receive' ? $quantity[$key] : -quantity[$key]),//if purchase return then insert amount in negative
                'item_cost_price'=>($register_mode == 'receive' ? $cost_price[$key] : -cost_price[$key]),//actually its avg cost comming from sale from
                'item_unit_price'=>0, //($register_mode == 'receive' ? $unit_price[$key] : -unit_price[$key]),//if purchase return then insert amount in negative
                //'discount_percent'=>$posted_values->discount,
                //'color_id'=>0,
                'size_id'=>0,
                'company_id'=> $_SESSION['company_id'],
                'unit_id'=>$unit_id[$key],
                'tax_id'=>0,
                'tax_rate'=>0,
                'service'=>$service,
                
            );
                
            $this->db->insert('pos_receivings_items', $data);
            // receiving itmes
            
                    //for logging
                    $msg = 'invoice no '. $new_invoice_no;
                    $this->M_logs->add_log($msg,"purchase transaction","created","trans");
                    // end logging
                    
            //insert items details
            //if items already exist according to expiry then update qty.
            if($this->M_items->checkItemOptions($item_id[$key],0,0))
            {
                $total_stock =  $this->M_items->total_stock($item_id[$key],0,0);
                        
                        //if products is to be return then it will subtract from qty and the avg cost will be reverse to original cost
                        if($service != 1)
                        {
                            if($register_mode == 'return')
                            {
                                $quantity1 = ($total_stock - $quantity[$key]);
                            }else {
                                $quantity1=($total_stock + $quantity[$key]); 
                            }

                        }else{
                            $quantity1 = 0;
                        }
                        
                 
                $option_data = array(
                'quantity'=>$quantity1,
                'unit_price' =>$unit_price[$key],
                'avg_cost'=>$this->M_items->getAvgCost($item_id[$key],$cost_price[$key],$quantity[$key],0,0,$register_mode)//calculate avg cost
                 
                );
              $this->db->update('pos_items_detail',$option_data,array('color_id'=>0,'size_id'=>0,'item_id'=>$item_id[$key]));
         
            }
            //item details
            
            //insert item info into inventory table
            $data1= array(
                
                'trans_item'=>$item_id[$key],
                'trans_comment'=>'KSRECV',
                'trans_inventory' =>$quantity[$key],
                'company_id'=> $_SESSION['company_id'],
                'trans_user'=>$_SESSION['user_id'],
                'invoice_no' => $new_invoice_no,
                'cost_price'=>$cost_price[$key],
                'unit_price'=>0,
                'delivery_date'=>$delivery_date,
                'currency_id'=>$currency_id,
                );
                
            $this->db->insert('pos_inventory', $data1);
            //insert item info into inventory table  
            
            $amount += ($quantity[$key] * $cost_price[$key]);
                
            //ADD INVENTORY AMOUNT WHICH IS SELECTED IN ITEM
            //@$inventory_acc_code[$this->input->post('inventory_acc_code')[$key]] += $cost_price[$key];
          
          
        endforeach;
        
        
        // }// Posting type  end if 
        // else{
        //     echo '{"invoice_no":"no-posting-type"}';
        // }
        
        }///$data_posted if close
        else{
            echo 'No Data';
        }
    }
    
    public function receipt($new_invoice_no)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        $data['receivings_items'] = $this->M_receivings->get_receiving_items($new_invoice_no);
        $receivings_items = $data['receivings_items'];
        
        $data['title'] = ($receivings_items[0]['register_mode'] == 'receive' ? 'Purchase' : 'Return').' Invoice # '.$new_invoice_no;
        $data['main'] = '';//($receivings_items[0]['register_mode'] == 'receive' ? '' : 'Return ').'Purchase Invoice';
        $data['invoice_no'] = $new_invoice_no;
        
        
        $company_id = $_SESSION['company_id'];
        $data['Company'] = $this->M_companies->get_companies($company_id);
            
        $this->load->view('templates/header',$data);
        $this->load->view('pos/receivings/v_receipt',$data);
        $this->load->view('templates/footer');
    }
    
    
    public function detail($receiving_id,$invoice_no='false')
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['receivings_items'] = $this->M_receivings->get_receiving_items_1($receiving_id,$invoice_no);
        
        $data['title'] = 'Purchase Detail';
        $data['main'] = 'Purchase Detail';
        //$data['invoice_no'] = $new_invoice_no;
        
           
        $this->load->view('templates/header',$data);
        $this->load->view('pos/receivings/v_purchase_detail',$data);
        $this->load->view('templates/footer');
    }
    
    public function purchase()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        //$this->output->enable_profiler();
        
        $data['title'] = 'Purchases';
        $data['main'] = 'Purchases';
        
        $data['supplierDL'] = $this->M_suppliers->getSupplierPostingTypes(2);//search for legder account
        
        
        $data['itemDDL'] = $this->M_items->getItemDropDown();
        //$data['colorsDDL'] = $this->M_colors->get_activeColorsDDL();
        $data['sizesDDL'] = $this->M_sizes->get_activeSizesDDL();
        $data['supplierDDL'] = $this->M_suppliers->getSupplierDropDown();//search for legder account
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/receivings/v_purchases',$data);
        $this->load->view('templates/footer');
    }
    
    public function allPurchases()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        $start_date = FY_START_DATE; //date("Y-m-d", strtotime("last year"));
        $to_date = FY_END_DATE; //date("Y-m-d");
        $fiscal_dates = "(From: ".date('d-m-Y',strtotime($start_date)) ." To:" .date('d-m-Y',strtotime($to_date)).")";
        
        $data['title'] = 'Purchases';//$fiscal_dates;
        $data['main'] = 'Purchases';
        
        
        $data['main_small'] = '';//$fiscal_dates;
        
        $data['receivings'] = $this->M_receivings->get_selected_receivings($start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/receivings/v_allPurchases',$data);
        $this->load->view('templates/footer');
    }
    
    function get_purchases_JSON()
    {
        // $start_date = FY_START_DATE; //date("Y-m-d", strtotime("last year"));
        // $to_date = FY_END_DATE; //date("Y-m-d");
        
        print_r(json_encode($this->M_receivings->get_selected_receivings()));
    }
    
    
    public function delete($invoice_no)
    {
        //if entry deleted then all item qty will be reversed
        $this->db->trans_start();
        
        $receiving_items = $this->M_receivings->get_receiving_items($invoice_no);
        //var_dump($receiving_items);
        
        foreach($receiving_items as $values)
        {
            $total_stock =  $this->M_items->total_stock($values['item_id'],-1,$values['size_id']);
            $quantity = ($total_stock - $values['quantity_purchased']);
             
            $option_data = array(
            'quantity'=>$quantity,
            //'unit_price' =>$values['item_unit_price'],
            'avg_cost'=>$this->M_items->getAvgCost($values['item_id'],$values['item_cost_price'],$values['quantity_purchased'],0,$values['size_id'],'return')//calculate avg cost
             
            );
            
          $this->db->update('pos_items_detail',$option_data,array('size_id'=>$values['size_id'],'item_id'=>$values['item_id']));
          
          $this->db->delete('pos_inventory',array('invoice_no'=>$invoice_no));
         
            //insert item info into inventory table
            // $data1= array(
                
            //     'trans_item'=>$values['item_id'],
            //     'trans_comment'=>'KSRECV Deleted',
            //     'trans_inventory'=>$values['quantity_purchased'],
            //     'company_id'=>$_SESSION['company_id'],
            //     'trans_user'=>$_SESSION['user_id'],
            //     'invoice_no'=>$invoice_no
            //     );
                
            // $this->db->insert('pos_inventory', $data1);
        }
        
         
        $this->M_receivings->delete($invoice_no);
        $this->db->trans_complete();
        
        $this->session->set_flashdata('message','Entry Deleted');
        redirect('trans/C_receivings/allPurchases','refresh');
    }
    
    public function delete_by_receiving_id($receiving_id,$invoice_no='',$edit='')
    {
        //if entry deleted then all item qty will be reversed
        $this->db->trans_start();
        
        $receiving_items = $this->M_receivings->get_receiving_items_1($receiving_id);
        //var_dump($receiving_items);
        
        foreach($receiving_items as $values)
        {
            $total_stock =  $this->M_items->total_stock($values['item_id'],-1,$values['size_id']);
            $quantity = ($total_stock - $values['qty']);
             
            $option_data = array(
            'quantity'=>$quantity,
            //'unit_price' =>$values['item_unit_price'],
            'avg_cost'=>$this->M_items->getAvgCost($values['item_id'],$values['item_cost_price'],$values['qty'],0,$values['size_id'],'return')//calculate avg cost
             
            );
            
          $this->db->update('pos_items_detail',$option_data,array('size_id'=>$values['size_id'],'item_id'=>$values['item_id']));
          
          $this->load->helper("url");
                
         if($values['ssdt'] != '')
           {   
               //DELETE THE PREVIOUSE PICTURE
                $file = FCPATH.'images/ssdt/'.$values['ssdt'];
                @unlink($file);
                /////////////
           } 
         if($values['fan'] != '')
           {   
                //DELETE THE PREVIOUSE PICTURE
                @$file = FCPATH.'images/fan/'.$values['fan'];
                unlink($file);
                /////////////
           } 
           if($values['supplier_pi'] != '')
           {   
               //DELETE THE PREVIOUSE PICTURE
                @$file = FCPATH.'images/supplier_pi/'.$values['supplier_pi'];
                unlink($file);
                /////////////
                
           } 
           if($values['quotation_file'] != '')
           {   
               //DELETE THE PREVIOUSE PICTURE
                @$file = FCPATH.'images/quotation/'.$values['quotation_file'];
                unlink($file);
                /////////////
                
           } 
            //insert item info into inventory table
            // $data1= array(
                
            //     'trans_item'=>$values['item_id'],
            //     'trans_comment'=>'KSRECV Deleted',
            //     'trans_inventory'=>$values['quantity_purchased'],
            //     'company_id'=>$_SESSION['company_id'],
            //     'trans_user'=>$_SESSION['user_id'],
            //     'invoice_no'=>$invoice_no
            //     );
                
            // $this->db->insert('pos_inventory', $data1);
        }
        
         
        $this->M_receivings->delete_by_id($receiving_id);
        $this->db->delete('pos_inventory',array('invoice_no'=>$invoice_no));
        $this->db->trans_complete();
        
        if($edit != 'edit'){
        $this->session->set_flashdata('message','Entry Deleted');
        redirect('trans/C_receivings/allPurchases','refresh');    
        }
        
    }
    
    function getPurchaseItemsJSON($receiving_id)
    {
        $data = $this->M_receivings->get_receiving_items($receiving_id);
        
        $outp = "";
        foreach($data as $rs)
        {
            //$tm =  json_decode($rs["teams_id"]);
            //print_r($tm);
            
            if ($outp != "") {$outp .= ",";}
            
            $outp .= '{"item_id":"'  . $rs["item_id"] . '",';
            $outp .= '"size_id":"'   . $rs["size_id"]. '",';
            $outp .= '"receiving_id":"'   . $rs["receiving_id"]. '",';
            $outp .= '"unit_id":"'   . $rs["unit_id"]. '",';
            $outp .= '"item_cost_price":"'   . $rs["item_cost_price"]. '",';
            $outp .= '"item_unit_price":"'   . $rs["item_unit_price"]. '",';
            $outp .= '"quantity_purchased":"'   . $rs["quantity_purchased"]. '",';
            $outp .= '"discount_percent":"'   . $rs["discount_percent"]. '",';
            $outp .= '"tax_id":"'   . $rs["tax_id"]. '",';
            $outp .= '"tax_rate":"'   . $rs["tax_rate"]. '",';
            $outp .= '"tax_name":"",';
            $outp .= '"inventory_acc_code":"",';
            
            $outp .= '"exchange_rate":"",';
            //$outp .= '"currency_id":"'   . $rs["currency_id"]. '",';
            $outp .= '"service":"'   . $rs["service"]. '",';
            
            $item_name = $this->M_items->get_ItemName($rs["item_id"]);
            $outp .= '"name":"'   . addslashes(@$item_name) . '",';
            
            $size_name = $this->M_sizes->get_sizeName($rs["size_id"]);
            $outp .= '"size":"'   . @$size_name . '",';
            
            $outp .= '"invoice_no":"'. $rs["invoice_no"]. '"}'; 
        }
            
        $outp ='['.$outp.']';
        echo $outp;
    }
    
    function getPurchasesJSON($receiving_id)
    {
        $data = $this->M_receivings->get_receivings($receiving_id);
        
        $outp = "";
        foreach($data as $rs)
        {
            //$tm =  json_decode($rs["teams_id"]);
            //print_r($tm);
            
            if ($outp != "") {$outp .= ",";}
            
            $outp .= '{"receiving_id":"'  . $rs["receiving_id"] . '",';
            $outp .= '"receiving_date":"'   . $rs["receiving_date"]. '",';
            $outp .= '"supplier_id":"'   . $rs["supplier_id"]. '",';
            $outp .= '"supplier_invoice_no":"'   . $rs["invoice_no"]. '",';
            $outp .= '"employee_id":"'   . $rs["employee_id"]. '",';
            $outp .= '"account":"'   . $rs["account"]. '",';
            $outp .= '"discount_value":"'   . $rs["discount_value"]. '",';
            $outp .= '"currency_id":"'   . $rs["currency_id"]. '",';
            $outp .= '"shipping":"'   . $rs["shipping"]. '",';
            $outp .= '"shipping_cost":"'   . $rs["shipping_cost"]. '",';
            $outp .= '"payment_status":"'   . $rs["payment_status"]. '",';
            $outp .= '"delivery_status":"'   . $rs["delivery_status"]. '",';
            $outp .= '"delivery_date":"'   . $rs["delivery_date"]. '",';
            $outp .= '"payment_date":"'   . $rs["payment_date"]. '",';
            $outp .= '"coa":"'   . $rs["coa"]. '",';
            $outp .= '"msds":"'   . $rs["msds"]. '",';
            $outp .= '"flowchart":"'   . $rs["flowchart"]. '",';
            $outp .= '"forme":"'   . $rs["forme"]. '",';
            $outp .= '"halal":"'   . $rs["halal"]. '",';
            $outp .= '"eta":"'   . $rs["eta"]. '",';
            $outp .= '"etd":"'   . $rs["etd"]. '",';
            $outp .= '"awb":"'   . $rs["awb"]. '",';
            
            $outp .= '"invoice_no":"'. $rs["invoice_no"]     . '"}'; 
        }
            
        $outp ='['.$outp.']';
        echo $outp;
    }
}