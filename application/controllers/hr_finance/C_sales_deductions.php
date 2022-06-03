<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_sales_deductions extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Sales Deduction';
        $data['main'] = 'List of Sales Deduction';
        
        $data['sales_deductions'] = $this->M_sales_deductions->get_sales_deductions();
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/sales_deductions/v_sales_deductions',$data);
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
                  
                  if($this->db->insert('finance_deductions',$data)) {
                    $this->session->set_flashdata('message','Sales Deduction Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_sales_deductions->add_sales_deductions();
            
            redirect('hr_finance/C_sales_deductions','refresh');
        }
        }
        
        $data['title'] = 'Add New Sales Deduction';
        $data['main'] = 'Add New Sales Deduction';
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/sales_deductions/create',$data);
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
                  
                  if($this->db->update('finance_deductions',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Sales Deduction Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_sales_deductions->update_sales_deductions();
            //$this->session->set_flashdata('message','sales_deductions Updated');
            redirect('hr_finance/C_sales_deductions','refresh');
        }
        }
        $data['title'] = 'Update Sales Deduction';
        $data['main'] = 'Update Sales Deduction';
        
        $data['update_sales_deductions'] = $this->M_sales_deductions->get_sales_deductions($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/sales_deductions/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_sales_deductions->delete_sales_deductions($id);
        $this->session->set_flashdata('message','Sales Deduction Deleted');
        redirect('hr_finance/C_sales_deductions','refresh');
    }

    //get all sales_deductions
    function sales_deductionsDDL($id=FALSE)
    {
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','100240M');
        
        echo json_encode($this->M_sales_deductions->get_sales_deductions($id));
        
    }
}