<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_claims extends MY_Controller{
    
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
        
        $data['title'] = 'Claims';
        $data['main'] = 'Claims';
        
        $data['claims'] = $this->M_claims->get_claim(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/claims/v_claims',$data);
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
                      'ncr'=>$this->input->post('ncr'),
                    //   'comments'=>$this->input->post('comments'),
                      'status'=>$this->input->post('status'),
                      'company_id'=> $_SESSION['company_id'],
                      'date_created'=> date('Y-m-d H:i:s'),
                     );
                  
                  if($this->db->insert('pos_claims',$data)) {
                    $this->session->set_flashdata('message','Claim Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_claims->add_claim();
            
            redirect('trans/C_claims','refresh');
        }
        }
        
        $data['title'] = 'Add New Claim';
        $data['main'] = 'Add New Claim';
        
        $data['receivingsDDL'] = $this->M_receivings->get_receivingsDDL();
        // $data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
        // $data['productsDDL'] = $this->M_items->getItemDropDown();
        // $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
            
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/claims/create',$data);
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
                      'ncr'=>$this->input->post('ncr'),
                    //   'comments'=>$this->input->post('comments'),
                      'status'=>$this->input->post('status'),
                     );
                  
                  if($this->db->update('pos_claims',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Claim Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_claims->update_claim();
            //$this->session->set_flashdata('message','claim Updated');
            redirect('trans/C_claims','refresh');
        }
        }
        $data['title'] = 'Update Claim';
        $data['main'] = 'Update Claim';
        
        $data['update_claim'] = $this->M_claims->get_claim($id);  
        $data['receivingsDDL'] = $this->M_receivings->get_receivingsDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/claims/edit',$data);
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
                  
                  if($this->db->update('pos_claims',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Claim Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_claims->update_claim();
            //$this->session->set_flashdata('message','claim Updated');
            redirect('trans/C_claims','refresh');
        }
        }
        $data['title'] = 'Update Claim Note';
        $data['main'] = 'Update Claim Note';
        
        $data['update_claim'] = $this->M_claims->get_claim($id);  
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/claims/v_claim_note',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_claims->delete_claim($id);
        $this->session->set_flashdata('message','Claim Deleted');
        redirect('trans/C_claims','refresh');
    }
}