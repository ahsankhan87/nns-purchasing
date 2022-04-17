<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_sourcing extends MY_Controller{
    
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
        
        $data['title'] = 'Sourcing';
        $data['main'] = 'Sourcing';
        
        $data['sourcings'] = $this->M_sourcings->get_sourcing(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/sourcings/v_sourcings',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('name', 'Product Name', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                      'product'=>$this->input->post('name'),
                      'requested_by'=>$this->input->post('requested_by'),
                      'request_date'=>$this->input->post('request_date'),
                      'sourced_by'=>$this->input->post('sourced_by'),
                      'urgency'=>$this->input->post('urgency'),
                      'department_id'=>$this->input->post('department_id'),
                      'status'=>$this->input->post('status'),
                      'company_id'=> $_SESSION['company_id'],
                      'date_created'=> date('Y-m-d'),
                     );
                  
                  if($this->db->insert('pos_sourcings',$data)) {
                    $this->session->set_flashdata('message','Sourcing Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_sourcings->add_sourcing();
            
            redirect('trans/C_sourcing','refresh');
        }
        }
        
        $data['title'] = 'Add New Sourcing';
        $data['main'] = 'Add New Sourcing';
        
        // $data['supplierDDL'] = $this->M_suppliers->getSupplierDropDown();
        $data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
        // $data['productsDDL'] = $this->M_items->getItemDropDown();
        // $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
            
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/sourcings/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('name', 'Name', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                      'product'=>$this->input->post('name'),
                      'requested_by'=>$this->input->post('requested_by'),
                      'request_date'=>$this->input->post('request_date'),
                      'sourced_by'=>$this->input->post('sourced_by'),
                      'urgency'=>$this->input->post('urgency'),
                      'department_id'=>$this->input->post('department_id'),
                      'status'=>$this->input->post('status'),
                      
                     );
                  
                  if($this->db->update('pos_sourcings',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Sourcing Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_sourcings->update_sourcing();
            //$this->session->set_flashdata('message','sourcing Updated');
            redirect('trans/C_sourcing','refresh');
        }
        }
        $data['title'] = 'Update Sourcing';
        $data['main'] = 'Update Sourcing';
        
        $data['update_sourcing'] = $this->M_sourcings->get_sourcing($id);  
        $data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/sourcings/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_sourcings->delete_sourcing($id);
        $this->session->set_flashdata('message','Sourcing Deleted');
        redirect('trans/C_sourcing/index','refresh');
    }
}