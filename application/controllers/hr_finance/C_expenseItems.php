<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_expenseItems extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Expense Items';
        $data['main'] = 'List of Expense Items';
        
        $data['expenseItems'] = $this->M_expenseItems->get_expenseItems();
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/expenseItems/v_expenseItems',$data);
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
                  
                  if($this->db->insert('finance_exp_items',$data)) {
                    $this->session->set_flashdata('message','Expense Items Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_expenseItems->add_expenseItems();
            
            redirect('hr_finance/C_expenseItems','refresh');
        }
        }
        
        $data['title'] = 'Add New expenseItems';
        $data['main'] = 'Add New expenseItems';
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/expenseItems/create',$data);
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
                  
                  if($this->db->update('finance_exp_items',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Expense Items Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_expenseItems->update_expenseItems();
            //$this->session->set_flashdata('message','expenseItems Updated');
            redirect('hr_finance/C_expenseItems','refresh');
        }
        }
        $data['title'] = 'Update Expense Items';
        $data['main'] = 'Update Expense Items';
        
        $data['update_expenseItems'] = $this->M_expenseItems->get_expenseItems($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/expenseItems/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_expenseItems->delete_expenseItems($id);
        $this->session->set_flashdata('message','Expense Items Deleted');
        redirect('hr_finance/C_expenseItems','refresh');
    }

    //get all expenseItems
    function expenseItemsDDL($id=FALSE)
    {
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','100240M');
        
        echo json_encode($this->M_expenseItems->get_expenseItems($id));
        
    }
}