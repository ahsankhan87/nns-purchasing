<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_samples_schedule extends MY_Controller{
    
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
        
        $data['title'] = 'List of Sample Schedule';
        $data['main'] = 'List of Sample Schedule';
        
        $data['samples_schedule'] = $this->M_samples_schedule->get_samples_schedule(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('rd/samples_schedule/v_samples_schedule',$data);
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
                  
                  if($this->db->insert('prod_samples_schedule',$data)) {
                    $this->session->set_flashdata('message','Sample Schedule Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_samples_schedule->add_samples_schedule();
            
            redirect('rd/C_samples_schedule','refresh');
        }
        }
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $data['title'] = 'Add New Sample Schedule';
        $data['main'] = 'Add New Sample Schedule';
        
        $this->load->view('templates/header',$data);
        $this->load->view('rd/samples_schedule/create',$data);
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
                  
                  if($this->db->update('rd_samples_schedule',$data,array('id'=>$this->input->post('id')))) {
                      
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
                                    'urgency'=>$this->input->post('urgency'),
                                    'requested_by'=>$this->input->post('requested_by'),
                    
                                    'date_updated'=>date("Y-m-d H:i:s"),
                                 );
                                 
                            $this->db->insert('rd_samples_history',$data1);    
                        }
                           
                    $this->session->set_flashdata('message','Sample Schedule Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_samples_schedule->update_samples_schedule();
            //$this->session->set_flashdata('message','samples_schedule Updated');
            redirect('rd/C_samples_schedule','refresh');
        }
        }
        $data['title'] = 'Update Sample Schedule';
        $data['main'] = 'Update Sample Schedule';
        
        $data['update_samples_schedule'] = $this->M_samples_schedule->get_samples_schedule($id);      
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('rd/samples_schedule/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_samples_schedule->delete_samples_schedule($id);
        $this->session->set_flashdata('message','Sample Schedule Deleted');
        redirect('rd/C_samples_schedule','refresh');
    }
}