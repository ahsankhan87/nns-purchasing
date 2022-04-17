<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_samples_request extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Samples Request';
        $data['main'] = 'List of Samples Request';
        
        $data['samples_request'] = $this->M_samples_request->get_samples_request();
        
        $this->load->view('templates/header',$data);
        $this->load->view('rd/samples_request/v_samples_request',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('product_id', 'Product Name', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'product_id'=>$this->input->post('product_id'),
                        'date_request'=>$this->input->post('date_request'),
                        'qty'=>$this->input->post('qty'),
                        'urgency'=>$this->input->post('urgency'),
                        'requested_by'=>$this->input->post('requested_by'),
                        'status'=>$this->input->post('status'),
                        'delivery_date'=>$this->input->post('delivery_date'),
                        'customer_id'=>$this->input->post('customer_id'),
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('prod_samples_request',$data)) {
                    $this->session->set_flashdata('message','Samples Request Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_samples_request->add_samples_request();
            
            redirect('rd/C_samples_request','refresh');
        }
        }
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $data['title'] = 'Add New Samples Request';
        $data['main'] = 'Add New Samples Request';
        
        $this->load->view('templates/header',$data);
        $this->load->view('rd/samples_request/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL,$history=0)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('product_id', 'Product', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'product_id'=>$this->input->post('product_id'),
                        'date_request'=>$this->input->post('date_request'),
                        'qty'=>$this->input->post('qty'),
                        'urgency'=>$this->input->post('urgency'),
                        'requested_by'=>$this->input->post('requested_by'),
                        'status'=>$this->input->post('status'),
                        'delivery_date'=>$this->input->post('delivery_date'),
                        'customer_id'=>$this->input->post('customer_id'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('prod_samples_request',$data,array('id'=>$_POST['id']))) {
                      
                     if($this->input->post('status') == 'Finished')
                        {
                            $this->db->insert('rd_samples_history',$data);   
                        }
                        
                    $this->session->set_flashdata('message','Samples Request Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
                if($history == 1){
                    redirect('rd/C_rd_history','refresh');
                }else{
                    redirect('rd/C_samples_request','refresh');
                }
            }
        }
        $data['title'] = 'Update Samples Request';
        $data['main'] = 'Update Samples Request';
        
        $data['update_samples_request'] = $this->M_samples_request->get_samples_request($id);      
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('rd/samples_request/edit',$data);
        $this->load->view('templates/footer');
    }
    
    
    function transfer($sample_request_id)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $production_request = $this->M_samples_request->get_samples_request($sample_request_id);
        
              $data = array(  
                    'product_id'=>$production_request[0]['product_id'],
                    'date'=>$production_request[0]['date_request'],
                    'qty'=>$production_request[0]['qty'],
                    'bmf'=>$this->input->post('bmf'),
                    'status'=>$production_request[0]['status'],
                     'urgency'=>$production_request[0]['urgency'],
                     'requested_by'=>$production_request[0]['requested_by'],
                    // 'status'=>$this->input->post('status'),
                    'delivery_date'=>$production_request[0]['delivery_date'],
                    'customer_id'=>$production_request[0]['customer_id'],
                    'date_created'=>date("Y-m-d H:i:s"),
                    
                 );
              
            //   print_r($data);
            //   echo die;
              
              if($this->db->insert('rd_samples_schedule',$data)) {
                    $this->session->set_flashdata('message','Samples Request Transferred to Schedule');
                    
                    //delete the production request id
                    $this->M_samples_request->delete_samples_request($sample_request_id);
                    //////////
                    
                }else{
                    $data['flash_message'] = false;
                }
                
        //$this->M_production_request->update_production_request();
        //$this->session->set_flashdata('message','production_request Updated');
        redirect('rd/C_samples_request','refresh');
    
        
    }
    
    function delete($id,$history=0)
    {
        $this->M_samples_request->delete_samples_request($id);
        $this->session->set_flashdata('message','Samples Request Deleted');
        
        if($history){
            redirect('rd/C_rd_history','refresh');
        }else{
            redirect('rd/C_samples_request','refresh');
        }
        
    }
}