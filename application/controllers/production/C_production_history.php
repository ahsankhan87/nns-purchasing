<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_production_history extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'Production History';
        $data['main'] = 'Production History';
        
        $data['production_request'] = $this->M_production_request->get_production_history();
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/history/v_history',$data);
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
                  
                  if($this->db->update('prod_production_history',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Note Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_Notes->update_Note();
            // $this->session->set_flashdata('message','Note Updated');
            redirect('production/C_production_history','refresh');
        }
        }
        $data['title'] = 'Update Note';
        $data['main'] = 'Update Note';
        
        $data['update_note'] = $this->M_production_request->get_production_history($id);  
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/history/v_note',$data);
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
                        'qty_produced'=>$this->input->post('qty_produced'),
                        'urgency'=>$this->input->post('urgency'),
                        'requested_by'=>$this->input->post('requested_by'),
                        'status'=>$this->input->post('status'),
                        'bmf'=>$this->input->post('bmf'),
                        'delivery_date'=>$this->input->post('delivery_date'),
                        'customer_id'=>$this->input->post('customer_id'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('prod_production_history',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Production History Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            
                    
            //$this->M_production_request->update_production_request();
            //$this->session->set_flashdata('message','production_request Updated');
            redirect('production/C_production_history','refresh');
        }
        }
        $data['title'] = 'Update Production Request';
        $data['main'] = 'Update Production Request';
        
        $data['update_production_request'] = $this->M_production_request->get_production_history($id);      
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/history/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_production_request->delete_production_history($id);
        $this->session->set_flashdata('message','Production History Deleted');
        redirect('production/C_production_history','refresh');
    }
    
}