<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_payment_terms extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Payment Terms';
        $data['main'] = 'List of Payment Terms';
        
        $data['payment_terms'] = $this->M_payment_terms->get_payment_terms();
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/payment_terms/v_payment_terms',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('name', 'Name', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  'name'=>$_POST['name'],
                        'status'=>1,
                      'company_id'=> $_SESSION['company_id']
                     );
                  
                  if($this->db->insert('finance_sales_pay_terms',$data)) {
                    $this->session->set_flashdata('message','Payment Terms Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_payment_terms->add_payment_terms();
            
            redirect('hr_finance/C_payment_terms','refresh');
        }
        }
        
        $data['title'] = 'Add New Payment Terms';
        $data['main'] = 'Add New Payment Terms';
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/payment_terms/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('name', 'Name', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  'name'=>$_POST['name'],
                        //'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
                  if($this->db->update('finance_sales_pay_terms',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Payment Terms Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_payment_terms->update_payment_terms();
            //$this->session->set_flashdata('message','payment_terms Updated');
            redirect('hr_finance/C_payment_terms','refresh');
        }
        }
        $data['title'] = 'Update Payment Terms';
        $data['main'] = 'Update Payment Terms';
        
        $data['update_payment_terms'] = $this->M_payment_terms->get_payment_terms($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/payment_terms/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_payment_terms->delete_payment_terms($id);
        $this->session->set_flashdata('message','Payment Terms Deleted');
        redirect('hr_finance/C_payment_terms','refresh');
    }

    //get all payment_terms
    function payment_termsDDL($id=FALSE)
    {
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','100240M');
        
        echo json_encode($this->M_payment_terms->get_payment_terms($id));
        
    }
}