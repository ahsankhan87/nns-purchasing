<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_paymentFor extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Payment For';
        $data['main'] = 'List of Payment For';
        
        $data['paymentfor'] = $this->M_paymentfor->get_paymentfor();
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/paymentfor/v_paymentfor',$data);
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
                  
                  if($this->db->insert('finance_exp_paymentfor',$data)) {
                    $this->session->set_flashdata('message','Payment For Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_paymentfor->add_paymentfor();
            
            redirect('hr_finance/C_paymentFor','refresh');
        }
        }
        
        $data['title'] = 'Add New Payment For';
        $data['main'] = 'Add New Payment For';
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/paymentfor/create',$data);
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
                  
                  if($this->db->update('finance_exp_paymentfor',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Payment For Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_paymentfor->update_paymentfor();
            //$this->session->set_flashdata('message','paymentfor Updated');
            redirect('hr_finance/C_paymentFor','refresh');
        }
        }
        $data['title'] = 'Update Payment For';
        $data['main'] = 'Update Payment For';
        
        $data['update_paymentfor'] = $this->M_paymentfor->get_paymentfor($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/paymentfor/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_paymentfor->delete_paymentfor($id);
        $this->session->set_flashdata('message','Payment For Deleted');
        redirect('hr_finance/C_paymentFor','refresh');
    }

    //get all paymentfor
    function paymentforDDL($id=FALSE)
    {
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','100240M');
        
        echo json_encode($this->M_paymentfor->get_paymentfor($id));
        
    }
}