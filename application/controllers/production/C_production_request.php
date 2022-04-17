<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_production_request extends MY_Controller{
    
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
        
        $data['title'] = 'List of Production Request';
        $data['main'] = 'List of Production Request';
        
        $data['production_request'] = $this->M_production_request->get_production_request(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/production_request/v_production_request',$data);
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
                        'bmf'=>$this->input->post('bmf'),
                        
                        'delivery_date'=>$this->input->post('delivery_date'),
                        'customer_id'=>$this->input->post('customer_id'),
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('prod_production_request',$data)) {
                    $this->session->set_flashdata('message','Production Request Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_production_request->add_production_request();
            
            redirect('production/C_production_request','refresh');
        }
        }
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $data['title'] = 'Add New Production Request';
        $data['main'] = 'Add New Production Request';
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/production_request/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
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
                        'bmf'=>$this->input->post('bmf'),
                        'delivery_date'=>$this->input->post('delivery_date'),
                        'customer_id'=>$this->input->post('customer_id'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('prod_production_request',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Production Request Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            if($this->input->post('status') == 'Finished' || $this->input->post('status') == 'Quarantine')
            {
                $this->db->insert('prod_production_history',$data);    
            }
            
                    
            //$this->M_production_request->update_production_request();
            //$this->session->set_flashdata('message','production_request Updated');
            redirect('production/C_production_request','refresh');
        }
        }
        $data['title'] = 'Update Production Request';
        $data['main'] = 'Update Production Request';
        
        $data['update_production_request'] = $this->M_production_request->get_production_request($id);      
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/production_request/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function transfer($prod_request_id)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $production_request = $this->M_production_request->get_production_request($prod_request_id);
        
              $data = array(  
                    'product_id'=>$production_request[0]['product_id'],
                    'customer_id'=>$production_request[0]['customer_id'],
                    'date'=>$production_request[0]['date_request'],
                    'qty'=>$production_request[0]['qty'],
                    'bmf'=>$production_request[0]['bmf'],
                    'status'=>$production_request[0]['status'],
                    'date_created'=>date("Y-m-d H:i:s"),
                    'delivery_date'=>$production_request[0]['delivery_date'],
                 );
              
            //   print_r($data);
            //   echo die;
              
              if($this->db->insert('prod_production_schedule',$data)) {
                    $this->session->set_flashdata('message','Production Request Transferred to Schedule');
                    
                    //delete the production request id
                    $this->M_production_request->delete_production_request($prod_request_id);
                    //////////
                    
                }else{
                    $data['flash_message'] = false;
                }
                
        //$this->M_production_request->update_production_request();
        //$this->session->set_flashdata('message','production_request Updated');
        redirect('production/C_production_request','refresh');
    
        
    }
    
    function delete($id)
    {
        $this->M_production_request->delete_production_request($id);
        $this->session->set_flashdata('message','Production Request Deleted');
        redirect('production/C_production_request','refresh');
    }
}