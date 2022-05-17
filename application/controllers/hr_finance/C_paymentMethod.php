<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_paymentMethod extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Payment Method';
        $data['main'] = 'List of Payment Method';
        
        $data['paymentMethod'] = $this->M_paymentMethod->get_paymentMethod();
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/paymentMethod/v_paymentMethod',$data);
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
                  
                  if($this->db->insert('finance_exp_paymentmethod',$data)) {
                    $this->session->set_flashdata('message','Payment Method Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_paymentMethod->add_paymentMethod();
            
            redirect('hr_finance/C_paymentMethod','refresh');
        }
        }
        
        $data['title'] = 'Add New Payment Method';
        $data['main'] = 'Add New Payment Method';
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/paymentMethod/create',$data);
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
                  
                  if($this->db->update('finance_exp_paymentmethod',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Payment Method Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_paymentMethod->update_paymentMethod();
            //$this->session->set_flashdata('message','paymentMethod Updated');
            redirect('hr_finance/C_paymentMethod','refresh');
        }
        }
        $data['title'] = 'Update Payment Method';
        $data['main'] = 'Update Payment Method';
        
        $data['update_paymentMethod'] = $this->M_paymentMethod->get_paymentMethod($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/paymentMethod/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_paymentMethod->delete_paymentMethod($id);
        $this->session->set_flashdata('message','Payment Method Deleted');
        redirect('hr_finance/C_paymentMethod','refresh');
    }

    //get all paymentMethod
    function paymentMethodDDL($id=FALSE)
    {
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','100240M');
        
        echo json_encode($this->M_paymentMethod->get_paymentMethod($id));
        
    }
}