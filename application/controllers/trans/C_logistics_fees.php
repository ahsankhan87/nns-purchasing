<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_logistics_fees extends MY_Controller{
    
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
        
        $data['title'] = 'Logistics Fees';
        $data['main'] = 'Logistics Fees';
        
        $data['logistics_fees'] = $this->M_logistics_fees->get_logistics_fee(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/logistics_fees/v_logistics_fees',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('receiving_id', 'PO #', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                      'receiving_id'=>$this->input->post('receiving_id'),
                      'shipping'=>$this->input->post('shipping'),
                      'billing_company'=>$this->input->post('billing_company'),
                      'reference_no'=>$this->input->post('reference_no'),
                      'total'=>$this->input->post('total'),
                      'payment_date'=>$this->input->post('payment_date'),
                      'comments'=>$this->input->post('comments'),
                      'payment_status'=>$this->input->post('payment_status'),
                      'company_id'=> $_SESSION['company_id'],
                      'date_created'=> date('Y-m-d H:i:s'),
                     );
                  
                  if($this->db->insert('pos_logistics_fees',$data)) {
                    $this->session->set_flashdata('message','Logistics Fee Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_logistics_fees->add_logistics_fee();
            
            redirect('trans/C_logistics_fees','refresh');
        }
        }
        
        $data['title'] = 'Add New Logistics Fee';
        $data['main'] = 'Add New Logistics Fee';
        
        $data['receivingsDDL'] = $this->M_receivings->get_receivingsDDL();
        // $data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
        // $data['productsDDL'] = $this->M_items->getItemDropDown();
        // $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
            
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/logistics_fees/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('receiving_id', 'PO #', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                      'receiving_id'=>$this->input->post('receiving_id'),
                      'shipping'=>$this->input->post('shipping'),
                      'billing_company'=>$this->input->post('billing_company'),
                      'reference_no'=>$this->input->post('reference_no'),
                      'total'=>$this->input->post('total'),
                      'payment_date'=>$this->input->post('payment_date'),
                      'comments'=>$this->input->post('comments'),
                      'payment_status'=>$this->input->post('payment_status'),
                      
                     );
                  
                  if($this->db->update('pos_logistics_fees',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Logistics Fee Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_logistics_fees->update_logistics_fee();
            //$this->session->set_flashdata('message','logistics_fee Updated');
            redirect('trans/C_logistics_fees','refresh');
        }
        }
        $data['title'] = 'Update Logistics Fee';
        $data['main'] = 'Update Logistics Fee';
        
        $data['update_logistics_fee'] = $this->M_logistics_fees->get_logistics_fee($id);  
        $data['receivingsDDL'] = $this->M_receivings->get_receivingsDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/logistics_fees/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function edit_note($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('comments', 'Comments', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                      //'receiving_id'=>$this->input->post('receiving_id'),
                      //'ncr'=>$this->input->post('ncr'),
                     'comments'=>$this->input->post('comments'),
                    //  'status'=>$this->input->post('status'),
                     );
                  
                  if($this->db->update('pos_logistics_fees',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Logistics Fee Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_claims->update_claim();
            //$this->session->set_flashdata('message','claim Updated');
            redirect('trans/C_logistics_fees','refresh');
        }
        }
        $data['title'] = 'Update Logistics Fee Note';
        $data['main'] = 'Update Logistics Fee Note';
        
        $data['update_logistics_fee'] = $this->M_logistics_fees->get_logistics_fee($id);  
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/logistics_fees/v_claim_note',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_logistics_fees->delete_logistics_fee($id);
        $this->session->set_flashdata('message','Logistics Fee Deleted');
        redirect('trans/C_logistics_fees','refresh');
    }
}