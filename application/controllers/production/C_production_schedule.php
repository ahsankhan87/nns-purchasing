<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_production_schedule extends MY_Controller{
    
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
        
        $data['title'] = 'List of Production Schedule';
        $data['main'] = 'List of Production Schedule';
        
        $data['production_schedule'] = $this->M_production_schedule->get_production_schedule(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/production_schedule/v_production_schedule',$data);
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
                        'date'=>$this->input->post('date'),
                        'qty'=>$this->input->post('qty'),
                        'bmf'=>$this->input->post('bmf'),
                        'status'=>$this->input->post('status'),
                        
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('prod_production_schedule',$data)) {
                    $this->session->set_flashdata('message','Production Schedule Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_production_schedule->add_production_schedule();
            
            redirect('production/C_production_schedule','refresh');
        }
        }
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $data['title'] = 'Add New Production Schedule';
        $data['main'] = 'Add New Production Schedule';
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/production_schedule/create',$data);
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
                        'date'=>$this->input->post('date'),
                        'qty'=>$this->input->post('qty'),
                        'bmf'=>$this->input->post('bmf'),
                        'status'=>$this->input->post('status'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('prod_production_schedule',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Production Schedule Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
            
            if($this->input->post('status') == 'Finished')
            {
                $data1 = array(  
                        'product_id'=>$this->input->post('product_id'),
                        'customer_id'=>$this->input->post('customer_id'),
                        'date_request'=>$this->input->post('date'),
                        'delivery_date'=>$this->input->post('delivery_date'),
                        'qty'=>$this->input->post('qty'),
                        'bmf'=>$this->input->post('bmf'),
                        'status'=>$this->input->post('status'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                     
                $this->db->insert('prod_production_history',$data1);    
            }
               
            //$this->M_production_schedule->update_production_schedule();
            //$this->session->set_flashdata('message','production_schedule Updated');
            redirect('production/C_production_schedule','refresh');
        }
        }
        $data['title'] = 'Update Production Schedule';
        $data['main'] = 'Update Production Schedule';
        
        $data['update_production_schedule'] = $this->M_production_schedule->get_production_schedule($id);      
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/production_schedule/edit',$data);
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
                     'note'=>$this->input->post('comments'),
                    //  'status'=>$this->input->post('status'),
                     );
                  
                  if($this->db->update('prod_production_schedule',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Note Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_claims->update_claim();
            //$this->session->set_flashdata('message','claim Updated');
            redirect('production/C_production_schedule','refresh');
        }
        }
        $data['title'] = 'Update Note';
        $data['main'] = 'Update Note';
        
        $data['update_production_schedule'] = $this->M_production_schedule->get_production_schedule($id);      
          
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/production_schedule/v_note',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_production_schedule->delete_production_schedule($id);
        $this->session->set_flashdata('message','Production Schedule Deleted');
        redirect('production/C_production_schedule','refresh');
    }
}