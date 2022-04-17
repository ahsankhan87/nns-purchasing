<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_customers extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Customers';
        $data['main'] = 'List of Customers';
        
        $data['customers'] = $this->M_prod_customers->get_prod_customer();
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/customers/v_customers',$data);
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
                  $data = array(  
                        'name'=>$this->input->post('name'),
                        'contact_number'=>$this->input->post('contact_number'),
                        'contact_person'=>$this->input->post('contact_person'),
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('prod_customers',$data)) {
                    $this->session->set_flashdata('message','Customer Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_prod_customers->add_prod_customer();
            
            redirect('production/C_customers','refresh');
        }
        }
        
        $data['title'] = 'Add New Customer';
        $data['main'] = 'Add New Customer';
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/customers/create',$data);
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
                        'name'=>$this->input->post('name'),
                        'contact_number'=>$this->input->post('contact_number'),
                        'contact_person'=>$this->input->post('contact_person'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('prod_customers',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Customer Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_prod_customers->update_prod_customer();
            //$this->session->set_flashdata('message','customer Updated');
            redirect('production/C_customers','refresh');
        }
        }
        $data['title'] = 'Update Customers';
        $data['main'] = 'Update Customers';
        
        $data['update_customer'] = $this->M_prod_customers->get_prod_customer($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/customers/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_prod_customers->delete_prod_customer($id);
        $this->session->set_flashdata('message','Customer Deleted');
        redirect('production/C_customers','refresh');
    }
}