<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_purchase_requests extends MY_Controller{
    
    function __construct()
    {
        parent::__construct(); 
        $this->lang->load('index');
    }
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $start_date = FY_START_DATE; //date("Y-m-d", strtotime("last year"));
        $to_date = FY_END_DATE; //date("Y-m-d");
        $fiscal_dates = "(From: ".date('d-m-Y',strtotime($start_date)) ." To:" .date('d-m-Y',strtotime($to_date)).")";
        
        $data['title'] = 'Purchase Requests';
        $data['main'] = 'Purchase Requests';
        
        $data['purchase_requests'] = $this->M_purchase_requests->get_purchase_request(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/purchase_requests/v_purchase_requests',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('item_id', 'item_id', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                      'item_id'=>$this->input->post('item_id'),
                    //   'supplier'=>$this->input->post('supplier'),
                      'qty'=>$this->input->post('qty'),
                      'unit_id'=>$this->input->post('unit_id'),
                    //   'price'=>$this->input->post('price'),
                    //   'currency'=>$this->input->post('currency'),
                      //'department_id'=>$this->input->post('department_id'),
                      'current_stock'=>$this->input->post('current_stock'),
                      'requirements'=>$this->input->post('requirements'),
                      'status'=>$this->input->post('status'),
                      'created_by'=>$this->input->post('created_by'),
                      'request_date'=>$this->input->post('request_date'),
                      'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('pos_purchase_requests',$data)) {
                    $this->session->set_flashdata('message','Purchase Request Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_purchase_requests->add_purchase_request();
            
            redirect('trans/C_purchase_requests','refresh');
        }
        }
        
        $data['title'] = 'Add New Purchase Request';
        $data['main'] = 'Add New Purchase Request';
        
        //$data['supplierDDL'] = $this->M_suppliers->getSupplierDropDown();
        //$data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
        $data['productsDDL'] = $this->M_items->getItemDropDown();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
            
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/purchase_requests/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('item_id', 'Product', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                      'item_id'=>$this->input->post('item_id'),
                    //   'supplier'=>$this->input->post('supplier'),
                      'qty'=>$this->input->post('qty'),
                      'unit_id'=>$this->input->post('unit_id'),
                    //   'price'=>$this->input->post('price'),
                    //   'currency'=>$this->input->post('currency'),
                      //'department_id'=>$this->input->post('department_id'),
                      'current_stock'=>$this->input->post('current_stock'),
                      'requirements'=>$this->input->post('requirements'),
                      'status'=>$this->input->post('status'),
                      'created_by'=>$this->input->post('created_by'),
                      'request_date'=>$this->input->post('request_date'),
                     );
                  
                  if($this->db->update('pos_purchase_requests',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Purchase Request Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_purchase_requests->update_purchase_request();
            //$this->session->set_flashdata('message','purchase_request Updated');
            redirect('trans/C_purchase_requests','refresh');
        }
        }
        $data['title'] = 'Update Purchase Request';
        $data['main'] = 'Update Purchase Request';
        
        $data['update_purchase_request'] = $this->M_purchase_requests->get_purchase_request($id);      
        //$data['supplierDDL'] = $this->M_suppliers->getSupplierDropDown();
        //$data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
        $data['productsDDL'] = $this->M_items->getItemDropDown();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/purchase_requests/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_purchase_requests->delete_purchase_request($id);
        $this->session->set_flashdata('message','Purchase Requests Deleted');
        redirect('trans/C_purchase_requests/','refresh');
    }
}