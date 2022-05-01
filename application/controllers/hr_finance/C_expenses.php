<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class C_expenses extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    }

    public function index($expenseType = '', $customer_id = '', $estimate_no = '')
    {
        $data = array('langs' => $this->session->userdata('lang'));

        $data['title'] = ucfirst($expenseType) . ' ' . lang('expenses');
        $data['main'] = ucfirst($expenseType) . ' ' . lang('expenses');

        $data['customer_id'] = $customer_id;
        $data['expenseType'] = $expenseType;

        $data['estimate_no'] = $estimate_no; // Estimate invoice no.

        //$data['itemDDL'] = $this->M_items->get_activeItems();
        $data['customersDDL'] = $this->M_customers->getCustomerDropDown();
        //$data['supplier_cust'] = $this->M_suppliers->get_cust_supp();
        //$data['emp_DDL'] = $this->M_employees->getEmployeeDropDown();
        //$data['expensesPostingTypeDDL'] = $this->M_postingTypes->get_expensesPostingTypesDDL();
        //$data['taxes'] = $this->M_taxes->get_activetaxes();

        $this->load->view('templates/header', $data);
        $this->load->view('hr_finance/expenses/v_create_expense', $data);
        $this->load->view('templates/footer');
    }
    public function detail($expenses_id)
    {
        $data = array('langs' => $this->session->userdata('lang'));

        $data['title'] = "Expense Summary";
        $data['main'] = "Expense Summary";

        $data['expenses_id'] = $expenses_id;

        $data['expenses'] = $this->M_expenses->get_expenses($expenses_id);
        $data['expenses_items'] = $this->M_expenses->get_expenses_items_only($expenses_id);
        
        $this->load->view('templates/header', $data);
        $this->load->view('hr_finance/expenses/v_expense_detail', $data);
        $this->load->view('templates/footer');
    }
    
    public function allPaymentFor($payment_for)
    {
        $data = array('langs' => $this->session->userdata('lang'));

        $data['title'] = "Expense Summary";
        $data['main'] = "Expense Summary";

        $data['payment_for'] = $payment_for;

        $data['expenses'] = $this->M_expenses->get_expenses_by_payment_for($payment_for);
        
        $this->load->view('templates/header', $data);
        $this->load->view('hr_finance/expenses/v_allexpenses_paymentfor', $data);
        $this->load->view('templates/footer');
    }

    public function allExpenses()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        $start_date = FY_START_DATE;  //date("Y-m-d", strtotime("last month"));
        $to_date = FY_END_DATE; //date("Y-m-d");
        $fiscal_dates = "(From: " . date('d-m-Y', strtotime($start_date)) . " To:" . date('d-m-Y', strtotime($to_date)) . ")";

        $data['title'] = lang('expenses');
        $data['main'] = lang('expenses');

        $data['expenses'] = $this->M_expenses->get_expenses(false, $start_date, $to_date);

        $this->load->view('templates/header', $data);
        $this->load->view('hr_finance/expenses/v_allexpenses', $data);
        $this->load->view('templates/footer');
    }

    public function editexpenses($invoice_no)
    {
        $data = array('langs' => $this->session->userdata('lang'));

        $data['title'] = lang('edit') . ' ' . lang('expenses');
        $data['main'] = lang('edit') . ' ' . lang('expenses');

        $data['expenseType'] = ''; //$expenseType;//CASH, CREDIT, CASH RETURN AND CREDIT RETURN
        $data['invoice_no'] = $invoice_no;
        $data['edit'] = true;
        //$data['isEstimate'] = $isEstimate;

        //$data['itemDDL'] = $this->M_items->get_allItemsforJSON();
        $data['customersDDL'] = $this->M_customers->getCustomerDropDown();
        $data['supplier_cust'] = $this->M_suppliers->get_cust_supp();
        $data['emp_DDL'] = $this->M_employees->getEmployeeDropDown();

        $this->load->view('templates/header', $data);
        $this->load->view('hr_finance/expenses/v_editexpensesProduct', $data);
        $this->load->view('templates/footer');
    }

    //expense the projuct angularjs
    public function expenseProducts()
    {
        $total_amount = 0;
        $discount = 0;
        $unit_price = 0;
        $cost_price = 0;

        if ($this->input->server('REQUEST_METHOD') === 'POST') {

            if (count((array)$this->input->post('charge_id')) > 0) {
                $this->db->trans_start();
                //GET PREVIOISE INVOICE NO  
                // @$prev_invoice_no = $this->M_expenses->getMAXexpenseInvoiceNo();
                // //$number = (int) substr($prev_invoice_no,11)+1; // EXTRACT THE LAST NO AND INCREMENT BY 1
                // //$new_invoice_no = 'POS'.date("Ymd").$number;
                // $number = (int) $prev_invoice_no + 1; // EXTRACT THE LAST NO AND INCREMENT BY 1
                // $new_invoice_no = 'S' . $number;
                $date_issued = $this->input->post("date_issued");
                //GET ALL ACCOUNT CODE WHICH IS TO BE POSTED AMOUNT
                $user_id = $_SESSION['user_id'];
                $company_id = $_SESSION['company_id'];
                $expense_date = $this->input->post("expense_date");
                $customer_id = $this->input->post("customer_id");
                $payment_for = $this->input->post("payment_for");
                $note = ($this->input->post("description") == '' ? '' : $this->input->post("description"));
                $category_id = $this->input->post("category_id");
                $amount = $this->input->post("amount");
                $payment_method = $this->input->post("payment_method");
                $approval = $this->input->post("approval");
                $receipted = $this->input->post("receipted");
                $cross_checked = $this->input->post("cross_checked");
                $total_amount =  $this->input->post("sub_total_charges");
                
                $data = array(
                    'company_id' => $company_id,
                    'payment_for' => $payment_for,
                    'user_id' => $user_id,
                    'expense_date' => $date_issued,
                    'date_issued' => $date_issued,
                    'category' => $category_id,
                    'payment_method' => $payment_method,
                    'approval' => $approval,
                    'amount' => $amount, //return will be in minus amount
                    'change'=>((double)$amount-(double)$total_amount),
                    'receipted'=>$receipted,
                    'cross_checked'=>$cross_checked,
                    'note'=>$note,
                    
                );
                $this->db->insert('finance_expenses', $data);
                $expense_id = $this->db->insert_id();
                ////////

                foreach ($this->input->post('charge_id') as $key => $value) {
                    
                    if ($value != "") {
                        $item_id  = htmlspecialchars(trim($value));
                        //$content = $this->input->post('content')[$key];
                        //$qty = $this->input->post('qty')[$key];
                        $unit_price = $this->input->post('unit_price_chr')[$key];
                        //$cost_price = $this->input->post('cost_price')[$key];
                        $subcategory_id = $this->input->post('subcategory_id')[$key];

                        $data = array(
                            'expense_id' => $expense_id,
                            'item' => $item_id,
                            'amount' =>  $unit_price, //if expenses return then insert amount in negative
                            'subcategory_id' => $subcategory_id,
                            
                        );

                        $this->db->insert('finance_expenses_items', $data);

                    }
                } //end foreach
                $this->db->trans_complete();
             
            } //check product count

            echo '1';
        } //end post if
    }

    //expense the projuct angularjs
    public function editexpenseProducts()
    {
        $total_amount = 0;
        $total_cost_amount = 0;
        $discount = 0;
        $unit_price = 0;
        $cost_price = 0;

        // get posted data
        $data_posted = json_decode(file_get_contents("php://input", true));

        //        print_r($data_posted);
        //        echo die;

        if (count((array)$data_posted) > 0) {
            $this->db->trans_start();

            //GET ALL ACCOUNT CODE WHICH IS TO BE POSTED AMOUNT
            $invoice_no = $data_posted->invoice_no;
            $expense_date = date('Y-m-d', strtotime($data_posted->expense_date));
            $customer_id = $data_posted->customer_id;
            $emp_id = $data_posted->emp_id;
            $supplier_id = $data_posted->supplier_id;
            $posting_type_code = $this->M_customers->getCustomerPostingTypes($customer_id);
            $expense_supp_posting_type_code = $this->M_suppliers->getCustSuppPostingTypes($supplier_id);
            $exchange_rate = ($data_posted->exchange_rate == '' ? 0 : $data_posted->exchange_rate);
            $currency_id = ($data_posted->currency_id == '' ? 0 : $data_posted->currency_id);
            $discount = ($data_posted->discount == '' ? 0 : $data_posted->discount);
            $narration = ($data_posted->description == '' ? '' : $data_posted->description);
            $total_tax_amount =  $data_posted->total_tax;
            $is_taxable =  $data_posted->is_taxable;
            $total_tax_amount =  ($is_taxable == 1 ? $data_posted->total_tax : 0);
            //$total_tax_amount =  $data_posted->total_tax;

            //if multi currency is used then multiply $exchange_rate with amount

            //if tax amount is checked or 1 then tax will be dedected otherwise not deducted from total amount

            if ($is_taxable == 1) {
                $total_amount =  ($data_posted->total_amount - $discount) - $total_tax_amount;
                $total_return_amount =  ($data_posted->total_amount - $discount) - $total_tax_amount; //FOR RETURN PURSPOSE
            } else {
                $total_amount =  ($data_posted->total_amount - $discount);
                $total_return_amount =  ($data_posted->total_amount - $discount); //FOR RETURN PURSPOSE
            }
            //////
            //////

            if (count($posting_type_code) !== 0 || count($expense_supp_posting_type_code) !== 0)
            //if(count($expense_supp_posting_type_code) !== 0)
            {
                if ($supplier_id) {
                    $posting_type_code = $expense_supp_posting_type_code;
                }

                //DELETE ALS expenseS AND ITEMS AND ACCOUNT ENTRY AGAINST INVOICE NO
                //AND THEN INSERT NEW ENTRIES.
                $this->delete($invoice_no, false);
                //////

                $data = array(
                    'company_id' => $_SESSION['company_id'],
                    'invoice_no' => $invoice_no,
                    'customer_id' => $customer_id,
                    'supplier_id' => $supplier_id,
                    'employee_id' => $emp_id,
                    'user_id' => $_SESSION['user_id'],
                    'expense_date' => $expense_date,
                    'register_mode' => $data_posted->register_mode,
                    'account' => $data_posted->expenseType,
                    //'amount_due'=>$data_posted->amount_due,
                    'description' => $narration,
                    'discount_value' => $discount,
                    'currency_id' => $currency_id,
                    'exchange_rate' => $exchange_rate,
                    'total_amount' => $total_amount,
                    'total_tax' => $total_tax_amount,
                    'is_taxable' => $is_taxable,
                );

                $this->db->insert('finance_expenses', $data);

                $expense_id = $this->db->insert_id();
                $inventory_acc_code = array();
                //extract JSON array items from posted data.
                foreach ($data_posted->items as $posted_values) :

                    $service = ($posted_values->service == null ? 0 : $posted_values->service);

                    $data = array(
                        'expense_id' => $expense_id,
                        'invoice_no' => $invoice_no,
                        'item_id' => $posted_values->item_id,
                        'description' => '',
                        'quantity_sold' => $posted_values->quantity,
                        'item_cost_price' => $posted_values->cost_price, //actually its avg cost comming from expense from
                        'item_unit_price' => $posted_values->unit_price,
                        'currency_id' => $currency_id,
                        'exchange_rate' => $exchange_rate,
                        'size_id' => $posted_values->size_id,
                        'company_id' => $_SESSION['company_id'],
                        //'discount_percent'=>($posted_values->discount_percent == null ? 0 : $posted_values->discount_percent),
                        'discount_value' => ($posted_values->discount_value == null ? 0 : $posted_values->discount_value),
                        'service' => $service,
                        'tax_id' => ($is_taxable == 1 ? $posted_values->tax_id : 0),
                        'tax_rate' => ($is_taxable == 1 ? $posted_values->tax_rate : 0),
                        'inventory_acc_code' => $posted_values->inventory_acc_code
                    );

                    $this->db->insert('finance_expenses_items', $data);

                    //for logging
                    $msg = 'invoice no ' . $invoice_no;
                    $this->M_logs->add_log($msg, "expense transaction", "created", "trans");
                    // end logging

                    //CHECK SERVICE IF SERVICE THEN DO NOT UPDATE QTY
                    if ($service !== 1) {
                        if ($this->M_items->checkItemOptions($posted_values->item_id, 0, $posted_values->size_id)) {
                            $total_stock =  $this->M_items->total_stock($posted_values->item_id, 0, $posted_values->size_id);

                            //if products is to be return then it will add from qty and the avg cost will be reverse to original cost
                            if ($data_posted->register_mode == 'return') {
                                $quantity = ($total_stock + $posted_values->quantity);
                            } else {
                                $quantity = ($total_stock - $posted_values->quantity);
                            }

                            $option_data = array(
                                'quantity' => $quantity
                            );
                            $this->db->update('pos_items_detail', $option_data, array('size_id' => $posted_values->size_id, 'item_id' => $posted_values->item_id));
                        }
                    }


                    //ADD ITEM DETAIL IN INVENTORY TABLE    
                    $data1 = array(
                        'trans_item' => $posted_values->item_id,
                        'trans_comment' => 'KSPOS',
                        'trans_inventory' => -$posted_values->quantity,
                        'company_id' => $_SESSION['company_id'],
                        'trans_user' => $_SESSION['user_id'],
                        'invoice_no' => $invoice_no,
                        'cost_price' => $posted_values->cost_price, //actually its avg cost comming from expense from
                        'unit_price' => $posted_values->unit_price,

                    );

                    $this->db->insert('pos_inventory', $data1);
                    //////////////

                    $cost_price += ($posted_values->quantity * $posted_values->cost_price);
                    $unit_price += ($posted_values->quantity * $posted_values->unit_price);

                    //discount percent if percentage is used
                    //$discount += ($posted_values->quantity * $posted_values->unit_price)*$posted_values->discount/100;

                    //ADD INVENTORY AMOUNT WHICH IS SELECTED IN product and services
                    @$inventory_acc_code[$posted_values->inventory_acc_code] += $posted_values->cost_price;

                endforeach;

                $service = $service; //again assing service to new variable bcuz of loop end 

                //if multi currency is used then multiply $exchange_rate with amount
                if (@$_SESSION['multi_currency'] == 1) {
                    //Total Cost amount
                    $total_cost_amount =  round(($cost_price) / $exchange_rate, 2);
                } else {
                    //Total Cost amount
                    $total_cost_amount =  round(($cost_price), 2);
                }

                //////////////////////////////////
                ////   ACCOUNT TRANSACTIONS  /////
                /////////////////////////////////
                if ($data_posted->register_mode == 'expense') {
                    if ($service !== 1) {
                        foreach ($inventory_acc_code as $inventory_code => $amountt) {

                            $inventory_dr_ledger_id = $posting_type_code[0]['cos_acc_code'];
                            $inventory_cr_ledger_id = $inventory_code; // USE INVENTORY ACCOUNT CODE FROM ITEM TABEL NOT POSTING TYPE TABLE
                            //////////////
                            $this->M_entries->addEntries($inventory_dr_ledger_id, $inventory_cr_ledger_id, $amountt, $amountt, ucwords($narration), $invoice_no, $expense_date);
                        }
                    }
                }
                if ($data_posted->register_mode == 'return') {
                    if ($service !== 1) {
                        foreach ($inventory_acc_code as $inventory_code => $amountt) {

                            $inventory_cr_ledger_id = $posting_type_code[0]['cos_acc_code'];
                            $inventory_dr_ledger_id = $inventory_code; // USE INVENTORY ACCOUNT CODE FROM ITEM TABEL NOT POSTING TYPE TABLE
                            //////////////
                            $this->M_entries->addEntries($inventory_dr_ledger_id, $inventory_cr_ledger_id, $amountt, $amountt, ucwords($narration), $invoice_no, $expense_date);
                        }
                    }
                }

                //  Cash Debit and expenses Credit
                if ($data_posted->expenseType == 'cash' && $data_posted->register_mode == 'expense') {
                    //Search for expenses and cash ledger account for account entry
                    //if invoice is cash then entry will be cash debit and expenses credit and vice versa
                    $dr_ledger_id = $posting_type_code[0]['cash_acc_code'];
                    $cr_ledger_id = $posting_type_code[0]['expenses_acc_code'];

                    $this->M_entries->addEntries($dr_ledger_id, $cr_ledger_id, $total_amount, $total_amount, ucwords($narration), $invoice_no, $expense_date);
                    ////////////////

                    ///////////////
                    //TAX JOURNAL ENTRY
                    if ($total_tax_amount > 0) {
                        $tax_dr_ledger_id = $posting_type_code[0]['cash_acc_code'];
                        $tax_cr_ledger_id = $posting_type_code[0]['expensestax_acc_code'];

                        $this->M_entries->addEntries($tax_dr_ledger_id, $tax_cr_ledger_id, $total_tax_amount, $total_tax_amount, ucwords($narration), $invoice_no, $expense_date);
                    }
                    ////////////////


                }

                //if expenses is on credit 
                //  AR - Customer Debit and expenses Credit
                elseif ($data_posted->expenseType == 'credit' && $data_posted->register_mode == 'expense') {
                    //Search for purchases and cash ledger account for account entry
                    //if invoice is cash then entry will be purchase debit and cash credit and vice versa
                    $dr_ledger_id = $posting_type_code[0]['receivable_acc_code'];
                    $cr_ledger_id = $posting_type_code[0]['expenses_acc_code'];


                    //for cusmoter payment table
                    if ($supplier_id) {
                        //JOURNAL ENTRY
                        $entry_id = $this->M_entries->addEntries($dr_ledger_id, $cr_ledger_id, $total_amount, $total_amount, ucwords($narration), $invoice_no, $expense_date);

                        //SUPPLIER PAYMENT ENTRY
                        $this->M_suppliers->addsupplierPaymentEntry($dr_ledger_id, $cr_ledger_id, $total_amount, 0, $supplier_id, $narration, $invoice_no, $expense_date, $exchange_rate, $entry_id);

                        /////////////////
                        //REDUCE THE TOTAL AMOUNT IN RECEINVING TO SHOW EXACT AMOUNT IN OUTSTANDING INVOICES
                        $credit_purchase = $this->M_receivings->get_creditPurchases($supplier_id);
                        foreach ($credit_purchase as $values) {
                            $prev_bal = $values['paid'];
                            $cur_amount = $total_return_amount; //current amount

                            if ($cur_amount > $prev_bal) {
                                $cur_amount = $total_return_amount;
                            } else if ($cur_amount < $prev_bal) {
                                $cur_amount = $prev_bal;
                            }

                            $data = array(
                                'paid' => ($cur_amount + $total_return_amount),
                            );

                            //$this->db->update('pos_receivings',$data,array('invoice_no'=>$values['invoice_no']));
                            $this->M_receivings->updatePaidAmount($values['invoice_no'], $data);

                            $cur_amount = ($total_return_amount + $prev_bal);

                            if ($cur_amount > 0) {
                                $total_return_amount = $cur_amount;
                            } else {
                                $total_return_amount = 0;
                            }
                        }
                        ///////////////
                    } else {

                        //JOURNAL ENTRY
                        $entry_id = $this->M_entries->addEntries($dr_ledger_id, $cr_ledger_id, $total_amount, $total_amount, ucwords($narration), $invoice_no, $expense_date);

                        //CUSTOMER PAYMENT ENTRY
                        $this->M_customers->addCustomerPaymentEntry($dr_ledger_id, $cr_ledger_id, $total_amount, 0, $customer_id, $narration, $invoice_no, $expense_date, $exchange_rate, $entry_id);

                        ///////////////
                        //TAX JOURNAL ENTRY
                        if ($total_tax_amount > 0) {
                            $tax_dr_ledger_id = $posting_type_code[0]['receivable_acc_code'];
                            $tax_cr_ledger_id = $posting_type_code[0]['expensestax_acc_code'];

                            $this->M_entries->addEntries($tax_dr_ledger_id, $tax_cr_ledger_id, $total_tax_amount, $total_tax_amount, ucwords($narration), $invoice_no, $expense_date);

                            //CUSTOMER expenseS TAX PAYMENT ENTRY
                            $this->M_customers->addCustomerPaymentEntry($tax_dr_ledger_id, $tax_cr_ledger_id, $total_tax_amount, 0, $customer_id, $narration, $invoice_no, $expense_date, $exchange_rate, $entry_id);
                            //////////////// tax
                        }
                    }

                    ///
                }
                //expenseS RETURN DEBITED AND
                elseif ($data_posted->expenseType == 'cash' && $data_posted->register_mode == 'return') {
                    //Search for expenses return and cash ledger account for account entry
                    //if invoice is cash then entry will be expenses return debit and cash credit and vice versa
                    $dr_ledger_id = $posting_type_code[0]['expensesreturn_acc_code'];
                    $cr_ledger_id = $posting_type_code[0]['cash_acc_code'];

                    //JOURNAL ENTRY
                    $this->M_entries->addEntries($dr_ledger_id, $cr_ledger_id, $total_amount, $total_amount, ucwords($narration), $invoice_no, $expense_date);

                    ///////////////
                    //TAX REVERSE JOURNAL ENTRY
                    if ($total_tax_amount > 0) {
                        $tax_dr_ledger_id = $posting_type_code[0]['expensestax_acc_code'];
                        $tax_cr_ledger_id = $posting_type_code[0]['cash_acc_code'];

                        $this->M_entries->addEntries($tax_dr_ledger_id, $tax_cr_ledger_id, $total_tax_amount, $total_tax_amount, ucwords($narration), $invoice_no, $expense_date);
                    }
                    ////////////////


                }
                ////expenseS RETURN DEBITED AND
                elseif ($data_posted->expenseType == 'credit' && $data_posted->register_mode == 'return') {
                    //Search for expenses return and cash ledger account for account entry
                    //if invoice is cash then entry will be expenses return debit and cash credit and vice versa

                    $dr_ledger_id = $posting_type_code[0]['expensesreturn_acc_code'];
                    $cr_ledger_id = $posting_type_code[0]['receivable_acc_code'];


                    //for cusmoter payment table
                    if ($supplier_id) {
                        //JOURNAL ENTRY
                        $entry_id = $this->M_entries->addEntries($dr_ledger_id, $cr_ledger_id, $total_amount, $total_amount, ucwords($narration), $invoice_no, $expense_date);

                        $this->M_suppliers->addsupplierPaymentEntry($cr_ledger_id, $dr_ledger_id, 0, $total_amount, $supplier_id, $narration, $invoice_no, $expense_date, $exchange_rate, $entry_id);

                        /////////////////
                        //REDUCE THE PAID AMOUNT IN RECEINVING TO SHOW EXACT AMOUNT IN OUTSTANDING INVOICES
                        $credit_purchase = $this->M_receivings->get_creditPurchases($supplier_id);
                        foreach ($credit_purchase as $values) {
                            $prev_bal = $values['paid'];
                            $cur_amount = $total_return_amount;

                            if ($cur_amount > $prev_bal) {
                                $cur_amount = $prev_bal;
                            } else if ($cur_amount < $prev_bal) {
                                $cur_amount = $total_return_amount;
                            }

                            $data = array(
                                'paid' => ($prev_bal - $cur_amount),
                            );

                            $this->db->update('pos_receivings', $data, array('invoice_no' => $values['invoice_no']));

                            $cur_amount = ($total_return_amount - $prev_bal);

                            if ($cur_amount > 0) {
                                $total_return_amount = $cur_amount;
                            } else {
                                $total_return_amount = 0;
                            }
                        }
                        ///////////////
                    } //supplier end
                    else {
                        //JOURNAL ENTRY
                        $entry_id = $this->M_entries->addEntries($dr_ledger_id, $cr_ledger_id, $total_amount, $total_amount, ucwords($narration), $invoice_no, $expense_date);

                        //customer entry
                        $this->M_customers->addCustomerPaymentEntry($cr_ledger_id, $dr_ledger_id, 0, $total_amount, $customer_id, $narration, $invoice_no, $expense_date, $exchange_rate, $entry_id);

                        ///////////////
                        //TAX REVERSE JOURNAL ENTRY
                        if ($total_tax_amount > 0) {
                            $tax_dr_ledger_id = $posting_type_code[0]['expensestax_acc_code'];
                            $tax_cr_ledger_id = $posting_type_code[0]['cash_acc_code'];

                            $this->M_entries->addEntries($tax_dr_ledger_id, $tax_cr_ledger_id, $total_tax_amount, $total_tax_amount, ucwords($narration), $invoice_no, $expense_date);

                            //CUSTOMER expenseS TAX PAYMENT ENTRY
                            $this->M_customers->addCustomerPaymentEntry($tax_cr_ledger_id, $tax_dr_ledger_id, 0, $total_tax_amount, $customer_id, $narration, $invoice_no, $expense_date, $exchange_rate, $entry_id);
                        }
                        ////////////////
                        //tax end

                        /////////////////
                        //REDUCE THE TOTAL AMOUNT IN expenseS TO SHOW EXACT AMOUNT IN OUTSTANDING INVOICES
                        $creditexpenses = $this->M_expenses->get_creditexpenses($customer_id);
                        foreach ($creditexpenses as $values) {
                            $prev_bal = $values['total_amount'];
                            $cur_amount = $total_return_amount;

                            if ($cur_amount > $prev_bal) {
                                $cur_amount = $prev_bal;
                            } else if ($cur_amount < $prev_bal) {
                                $cur_amount = $total_return_amount;
                            }

                            $data = array(
                                'total_amount' => ($prev_bal - $cur_amount),
                            );

                            $this->db->update('finance_expenses', $data, array('invoice_no' => $values['invoice_no']));

                            $cur_amount = ($total_return_amount - $prev_bal);

                            if ($cur_amount > 0) {
                                $total_return_amount = $cur_amount;
                            } else {
                                $total_return_amount = 0;
                            }
                        }
                        ///////////////
                    } //customer end


                }
                //IF DISCOUNT PAID
                // expenseS DICOUNT DEBIT AND expenseS CREDIT
                if ($data_posted->register_mode == 'expense') {
                    if ($discount != 0) {

                        $dr_ledger_discount_id = $posting_type_code[0]['expensesdis_acc_code'];
                        //journal entries 
                        // expenseS DICOUNT DEBIT AND expenseS CREDIT
                        $this->M_entries->addEntries($dr_ledger_discount_id, $cr_ledger_id, $discount, $discount, $narration, $invoice_no, $expense_date);
                    }
                } elseif ($data_posted->register_mode == 'return') {
                    if ($discount != 0) {

                        $cr_ledger_discount_id = $posting_type_code[0]['expensesdis_acc_code'];
                        //journal entries 
                        // expenseS DICOUNT CREDIT AND expenseS OR A/C RECEIVABLE DEBITED
                        $this->M_entries->addEntries($dr_ledger_id, $cr_ledger_discount_id, $discount, $discount, $narration, $invoice_no, $expense_date);
                    }
                }

                echo '{"invoice_no":"' . $invoice_no . '"}'; //redirect to receipt page using this $receiving_id

                $this->db->trans_complete();

                /////////////////////////////
                //      ACCOUNTS CLOSED ..///
                /////////////////////////////

            } // Posting type  end if 
            else {
                echo '{"invoice_no":"no-posting-type"}';
            }
        } //$data_posted if close
        else {
            echo 'No Data';
        }
    }
    public function receipt($new_invoice_no)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        $data['expenses_items'] = $this->M_expenses->get_expenses_items($new_invoice_no);
        $expenses_items = $data['expenses_items'];

        //////////////////////////////
        // QR Code
        $this->load->library('ciqrcode');
        ///////////////////////

        $data['title'] = ($expenses_items[0]['register_mode'] == 'expense' ? 'expenses' : 'Return') . ' Invoice #' . $new_invoice_no;
        $data['main'] = ''; //($expenses_items[0]['register_mode'] == 'expense' ? 'expenses' : 'Return').' Invoice #'.$new_invoice_no;
        $data['invoice_no'] = $new_invoice_no;

        $company_id = $_SESSION['company_id'];
        $data['Company'] = $this->M_companies->get_companies($company_id);

        $this->load->view('templates/header', $data);
        $this->load->view('hr_finance/expenses/v_receipt_small', $data);
        //  $this->load->view('hr_finance/expenses/v_receipt',$data);
        $this->load->view('templates/footer');
    }


    function get_expenses_JSON()
    {
        $start_date = FY_START_DATE;  //date("Y-m-d", strtotime("last year"));
        $to_date = FY_END_DATE; //date("Y-m-d");

        print_r(json_encode($this->M_expenses->get_selected_expenses($start_date, $to_date)));
    }

    public function getCustomerCurrencyJSON($customer_id)
    {
        $customersCurrency = $this->M_customers->get_customerCurrency($customer_id);
        echo json_encode($customersCurrency);
    }

    public function delete($invoice_no, $redirect = true)
    {
        //if entry deleted then all item qty will be reversed
        $expenses_items = $this->M_expenses->get_expenses_items($invoice_no);

        $this->db->trans_start();

        foreach ($expenses_items as $values) {
            $total_stock =  $this->M_items->total_stock($values['item_id'], -1, $values['size_id']);

            //if products is to be return then it will add from qty and the avg cost will be reverse to original cost
            $quantity = ($total_stock + $values['quantity_sold']);

            $option_data = array(
                'quantity' => $quantity
            );
            $this->db->update('pos_items_detail', $option_data, array('size_id' => $values['size_id'], 'item_id' => $values['item_id']));

            //ADD ITEM DETAIL IN INVENTORY TABLE    
            $data1 = array(
                'trans_item' => $values['item_id'],
                'trans_comment' => 'KSPOS Deleted',
                'trans_inventory' => -$values['quantity_sold'],
                'company_id' => $_SESSION['company_id'],
                'trans_user' => $_SESSION['user_id'],
                'invoice_no' => $invoice_no
            );

            $this->db->insert('pos_inventory', $data1);
            //////////////
        }


        $this->M_expenses->delete($invoice_no);
        $this->db->trans_complete();

        if ($redirect === true) {
            $this->session->set_flashdata('message', 'Entry Deleted');
            redirect('hr_finance/C_expenses/allexpenses', 'refresh');
        }
    }

    function getexpensesItemsJSON($invoice_no)
    {
        $data = $this->M_expenses->get_expenses_items_only($invoice_no);

        $outp = "";
        foreach ($data as $rs) {
            //$tm =  json_decode($rs["teams_id"]);
            //print_r($tm);

            if ($outp != "") {
                $outp .= ",";
            }

            $outp .= '{"item_id":"'  . $rs["item_id"] . '",';
            $outp .= '"size_id":"'   . $rs["size_id"] . '",';
            $outp .= '"unit_id":"'   . $rs["unit_id"] . '",';
            $outp .= '"item_cost_price":"'   . $rs["item_cost_price"] . '",';
            $outp .= '"item_unit_price":"'   . $rs["item_unit_price"] . '",';
            $outp .= '"quantity_sold":"'   . $rs["quantity_sold"] . '",';
            $outp .= '"discount_percent":"'   . $rs["discount_percent"] . '",';
            $outp .= '"discount_value":"'   . $rs["discount_value"] . '",';
            $outp .= '"tax_id":"'   . $rs["tax_id"] . '",';
            $outp .= '"tax_rate":"'   . $rs["tax_rate"] . '",';
            $outp .= '"tax_name":"",';
            $outp .= '"inventory_acc_code":"'   . $rs["inventory_acc_code"] . '",';
            $outp .= '"service":"'   . $rs["service"] . '",';

            $item_name = $this->M_items->get_ItemName($rs["item_id"]);
            $outp .= '"name":"'   . @$item_name . '",';

            
            $outp .= '"invoice_no":"' . $rs["invoice_no"]     . '"}';
        }

        $outp = '[' . $outp . ']';
        echo $outp;
    }


    function getexpensesJSON($invoice_no)
    {
        $data = $this->M_expenses->get_expenses_by_invoice($invoice_no);

        $outp = "";
        foreach ($data as $rs) {
            //$tm =  json_decode($rs["teams_id"]);
            //print_r($tm);

            if ($outp != "") {
                $outp .= ",";
            }

            $outp .= '{"expense_time":"'  . $rs["expense_time"] . '",';
            $outp .= '"expense_date":"'   . $rs["expense_date"] . '",';
            $outp .= '"customer_id":"'   . $rs["customer_id"] . '",';
            $outp .= '"employee_id":"'   . $rs["employee_id"] . '",';
            $outp .= '"user_id":"'   . $rs["user_id"] . '",';
            $outp .= '"register_mode":"'   . $rs["register_mode"] . '",';
            $outp .= '"account":"'   . $rs["account"] . '",';
            $outp .= '"description":"'   . $rs["description"] . '",';
            $outp .= '"discount_value":"'   . $rs["discount_value"] . '",';
            $outp .= '"total_amount":"'   . $rs["total_amount"] . '",';
            $outp .= '"total_tax":"'   . $rs["total_tax"] . '",';
            $outp .= '"paid":"'   . $rs["paid"] . '",';
            $outp .= '"is_taxable":"'   . $rs["is_taxable"] . '",';

            $outp .= '"exchange_rate":"'   . $rs["exchange_rate"] . '",';
            $outp .= '"currency_id":"'   . $rs["currency_id"] . '",';

            $outp .= '"invoice_no":"' . $rs["invoice_no"]     . '"}';
        }

        $outp = '[' . $outp . ']';
        echo $outp;
    }
}
