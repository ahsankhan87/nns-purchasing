<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_sales_charges extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Sales Charges';
        $data['main'] = 'List of Sales Charges';
        
        $data['sales_charges'] = $this->M_sales_charges->get_sales_charges();
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/sales_charges/v_sales_charges',$data);
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
                  
                  if($this->db->insert('finance_charges',$data)) {
                    $this->session->set_flashdata('message','Sales Charges Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_sales_charges->add_sales_charges();
            
            redirect('hr_finance/C_sales_charges','refresh');
        }
        }
        
        $data['title'] = 'Add New Sales Charges';
        $data['main'] = 'Add New Sales Charges';
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/sales_charges/create',$data);
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
                  
                  if($this->db->update('finance_charges',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Sales Charges Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_sales_charges->update_sales_charges();
            //$this->session->set_flashdata('message','sales_charges Updated');
            redirect('hr_finance/C_sales_charges','refresh');
        }
        }
        $data['title'] = 'Update Sales Charges';
        $data['main'] = 'Update Sales Charges';
        
        $data['update_sales_charges'] = $this->M_sales_charges->get_sales_charges($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/sales_charges/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_sales_charges->delete_sales_charges($id);
        $this->session->set_flashdata('message','Sales Charges Deleted');
        redirect('hr_finance/C_sales_charges','refresh');
    }

    //get all sales_charges
    function sales_chargesDDL($id=FALSE)
    {
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','100240M');
        
        echo json_encode($this->M_sales_charges->get_sales_charges($id));
        
    }
}