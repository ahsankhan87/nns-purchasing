<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_rd_history extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'R&D History';
        $data['main'] = 'R&D History';
        
        $data['samples_request'] = $this->M_samples_request->get_rd_history();
        
        $this->load->view('templates/header',$data);
        $this->load->view('rd/history/v_history',$data);
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
                  
                  if($this->db->update('prod_samples_request',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Note Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_Notes->update_Note();
            // $this->session->set_flashdata('message','Note Updated');
            redirect('rd/C_rd_history','refresh');
        }
        }
        $data['title'] = 'Update Note';
        $data['main'] = 'Update Note';
        
        $data['update_note'] = $this->M_samples_request->get_samples_request($id);      
        
        
        $this->load->view('templates/header',$data);
        $this->load->view('rd/history/v_note',$data);
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
                        'delivery_date'=>$this->input->post('delivery_date'),
                        'customer_id'=>$this->input->post('customer_id'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('prod_samples_request',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Samples History Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_samples_request->update_samples_request();
            //$this->session->set_flashdata('message','samples_request Updated');
            redirect('rd/C_rd_history','refresh');
        }
        }
        $data['title'] = 'Update Samples History';
        $data['main'] = 'Update Samples History';
        
        $data['update_samples_request'] = $this->M_samples_request->get_rd_history($id);      
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('rd/history/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_samples_request->delete_samples_history($id);
        $this->session->set_flashdata('message','Samples History Deleted');
        redirect('rd/C_rd_history','refresh');
    }
}