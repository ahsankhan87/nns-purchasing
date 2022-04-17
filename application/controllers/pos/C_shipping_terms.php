<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_shipping_terms extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    }
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Shipping Terms';
        $data['main'] = 'List of Shipping Terms';
        
        $data['shipping_terms'] = $this->M_shipping_terms->get_shipping_term();
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/shipping_terms/v_shipping_terms',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
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
                  $data = array(  'name'=>$_POST['name'],
                        'status'=>1,
                      'company_id'=> $_SESSION['company_id']
                     );
                  
                  if($this->db->insert('pos_shipping_terms',$data)) {
                    $this->session->set_flashdata('message','Shipping Term Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_shipping_terms->add_shipping_term();
            
            redirect('pos/C_shipping_terms/index','refresh');
        }
        }
        
        $data['title'] = 'Add New Shipping Term';
        $data['main'] = 'Add New Shipping Term';
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/shipping_terms/create',$data);
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
                  $data = array(  'name'=>$_POST['name'],
                        //'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
                  if($this->db->update('pos_shipping_terms',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Shipping Term Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_shipping_terms->update_shipping_term();
            //$this->session->set_flashdata('message','shipping_term Updated');
            redirect('pos/C_shipping_terms/index','refresh');
        }
        }
        $data['title'] = 'Update Shipping Term';
        $data['main'] = 'Update Shipping Term';
        
        $data['update_shipping_term'] = $this->M_shipping_terms->get_shipping_term($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/shipping_terms/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_shipping_terms->delete_shipping_term($id);
        $this->session->set_flashdata('message','Shipping Term Deleted');
        redirect('pos/C_shipping_terms/index','refresh');
    }
}