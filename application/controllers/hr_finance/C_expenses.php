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

    public function edit($expense_id)
    {
        $data = array('langs' => $this->session->userdata('lang'));

        $data['title'] = lang('edit') . ' ' . lang('expenses');
        $data['main'] = lang('edit') . ' ' . lang('expenses');

        $data['expenseType'] = ''; //$expenseType;//CASH, CREDIT, CASH RETURN AND CREDIT RETURN
        $data['expense_id'] = $expense_id;
        $data['edit'] = true;
        //$data['isEstimate'] = $isEstimate;

        $this->load->view('templates/header', $data);
        $this->load->view('hr_finance/expenses/v_edit_expense', $data);
        $this->load->view('templates/footer');
    }

    //expense the projuct angularjs
    public function expenseProducts($edit = null,$expense_id=null)
    {
        $total_amount = 0;
        $discount = 0;
        $unit_price = 0;
        $cost_price = 0;

        if ($this->input->server('REQUEST_METHOD') === 'POST') {

            if (count((array)$this->input->post('charge_id')) > 0) {
                $this->db->trans_start();
                
                //IF EDIT THEN DELETE ALL INVOICES AND INSERT AGAIN
                if($edit != null)
                {
                    $this->delete($expense_id,false);
                }

                $date_issued = $this->input->post("date_issued");
                //GET ALL ACCOUNT CODE WHICH IS TO BE POSTED AMOUNT
                $user_id = $_SESSION['user_id'];
                $company_id = $_SESSION['company_id'];
                $expense_date = $this->input->post("expense_date");
                $customer_id = $this->input->post("customer_id");
                $payment_for_id = $this->input->post("payment_for");
                $note = ($this->input->post("description") == '' ? '' : $this->input->post("description"));
                $category_id = $this->input->post("category_id");
                $amount = $this->input->post("amount");
                $payment_method_id = $this->input->post("payment_method");
                $approval = $this->input->post("approval");
                $receipted = $this->input->post("receipted");
                $cross_checked = $this->input->post("cross_checked");
                $total_amount =  $this->input->post("sub_total_charges");
                
                if (isset($_FILES['receipted_file']) && $_FILES['receipted_file']['error'] == 0) {

                // uploads image in the folder images
                    $temp = explode(".", $_FILES["receipted_file"]["name"]);
                    $newfilename = substr(md5(time()), 0, 10) . '.' . end($temp);
                    move_uploaded_file($_FILES['receipted_file']['tmp_name'], 'images/expenses/' . $newfilename);
                    $receipted_file = $newfilename;
                }else{
                    $receipted_file = $this->input->post('receipted_file_old');
                }

                $data = array(
                    //($edit != null ? 'id' : '') => ($edit != null ? $expense_id : ''),
                    'company_id' => $company_id,
                    'payment_for_id' => $payment_for_id,
                    'user_id' => $user_id,
                    'expense_date' => $date_issued,
                    'date_issued' => $date_issued,
                    'category_id' => $category_id,
                    'payment_method_id' => $payment_method_id,
                    'approval' => $approval,
                    'amount' => $amount, //return will be in minus amount
                    'change'=>((double)$amount-(double)$total_amount),
                    'receipted'=>$receipted,
                    'cross_checked'=>$cross_checked,
                    'note'=>$note,
                    'receipted_file'=>$receipted_file,
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
                            'expense_item_id' => $item_id,
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

    public function delete($id, $redirect = true)
    {
        $this->db->trans_start();

        $this->M_expenses->delete($id);
        $this->db->trans_complete();

        if ($redirect === true) {
            $this->session->set_flashdata('message', 'Entry Deleted');
            redirect('hr_finance/C_expenses/allexpenses', 'refresh');
        }
    }

    function getExpenseItemsJSON($expenses_id)
    {
        $data = $this->M_expenses->get_expenses_items_only($expenses_id);
        print_r(json_encode($data));

        // $outp = "";
        // foreach ($data as $rs) {
        //     //$tm =  json_decode($rs["teams_id"]);
        //     //print_r($tm);

        //     if ($outp != "") {
        //         $outp .= ",";
        //     }

        //     $outp .= '{"item_id":"'  . $rs["item_id"] . '",';
        //     $outp .= '"size_id":"'   . $rs["size_id"] . '",';
        //     $outp .= '"unit_id":"'   . $rs["unit_id"] . '",';
        //     $outp .= '"item_cost_price":"'   . $rs["item_cost_price"] . '",';
        //     $outp .= '"item_unit_price":"'   . $rs["item_unit_price"] . '",';
        //     $outp .= '"quantity_sold":"'   . $rs["quantity_sold"] . '",';
        //     $outp .= '"discount_percent":"'   . $rs["discount_percent"] . '",';
        //     $outp .= '"discount_value":"'   . $rs["discount_value"] . '",';
        //     $outp .= '"tax_id":"'   . $rs["tax_id"] . '",';
        //     $outp .= '"tax_rate":"'   . $rs["tax_rate"] . '",';
        //     $outp .= '"tax_name":"",';
        //     $outp .= '"inventory_acc_code":"'   . $rs["inventory_acc_code"] . '",';
        //     $outp .= '"service":"'   . $rs["service"] . '",';

        //     $item_name = $this->M_items->get_ItemName($rs["item_id"]);
        //     $outp .= '"name":"'   . @$item_name . '",';

            
        //     $outp .= '"invoice_no":"' . $rs["invoice_no"]     . '"}';
        // }

        // $outp = '[' . $outp . ']';
        // echo $outp;
    }


    function getexpensesJSON($id)
    {
        $data = $this->M_expenses->get_expenses($id);
        print_r(json_encode($data));

        // $outp = "";
        // foreach ($data as $rs) {
        //     //$tm =  json_decode($rs["teams_id"]);
        //     //print_r($tm);

        //     if ($outp != "") {
        //         $outp .= ",";
        //     }

        //     $outp .= '{"expense_time":"'  . $rs["expense_time"] . '",';
        //     $outp .= '"expense_date":"'   . $rs["expense_date"] . '",';
        //     $outp .= '"customer_id":"'   . $rs["customer_id"] . '",';
        //     $outp .= '"employee_id":"'   . $rs["employee_id"] . '",';
        //     $outp .= '"user_id":"'   . $rs["user_id"] . '",';
        //     $outp .= '"register_mode":"'   . $rs["register_mode"] . '",';
        //     $outp .= '"account":"'   . $rs["account"] . '",';
        //     $outp .= '"description":"'   . $rs["description"] . '",';
        //     $outp .= '"discount_value":"'   . $rs["discount_value"] . '",';
        //     $outp .= '"total_amount":"'   . $rs["total_amount"] . '",';
        //     $outp .= '"total_tax":"'   . $rs["total_tax"] . '",';
        //     $outp .= '"paid":"'   . $rs["paid"] . '",';
        //     $outp .= '"is_taxable":"'   . $rs["is_taxable"] . '",';

        //     $outp .= '"exchange_rate":"'   . $rs["exchange_rate"] . '",';
        //     $outp .= '"currency_id":"'   . $rs["currency_id"] . '",';

        //     $outp .= '"invoice_no":"' . $rs["invoice_no"]     . '"}';
        // }

        // $outp = '[' . $outp . ']';
        // echo $outp;
    }
}
