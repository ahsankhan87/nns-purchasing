<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_expenseSubCategory extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Sub Category';
        $data['main'] = 'List of Sub Category';
        
        $data['expenseSubCategory'] = $this->M_expenseSubCategory->get_expenseSubCategory();
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/expenseSubCategory/v_expenseSubCategory',$data);
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
                        'category_id'=>$_POST['category_id'],
                        'company_id'=> $_SESSION['company_id']
                     );
                  
                  if($this->db->insert('finance_exp_subcategory',$data)) {
                    $this->session->set_flashdata('message',' Sub Category Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_expenseSubCategory->add_expenseSubCategory();
            
            redirect('hr_finance/C_expenseSubCategory','refresh');
        }
        }
        
        $data['title'] = 'Add New expenseSubCategory';
        $data['main'] = 'Add New expenseSubCategory';
        $data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
            
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/expenseSubCategory/create',$data);
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
                        'category_id'=>$_POST['category_id'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
                  if($this->db->update('finance_exp_subcategory',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message',' Sub Category Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_expenseSubCategory->update_expenseSubCategory();
            //$this->session->set_flashdata('message','expenseSubCategory Updated');
            redirect('hr_finance/C_expenseSubCategory','refresh');
        }
        }
        $data['title'] = 'Update expenseSubCategory';
        $data['main'] = 'Update expenseSubCategory';
        
        $data['update_expenseSubCategory'] = $this->M_expenseSubCategory->get_expenseSubCategory($id);      
        $data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
            
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/expenseSubCategory/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_expenseSubCategory->delete_expenseSubCategory($id);
        $this->session->set_flashdata('message',' Sub Category Deleted');
        redirect('hr_finance/C_expenseSubCategory','refresh');
    }

    //get all expenseSubCategory
    function expenseSubCategoryDDL($id=FALSE)
    {
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','100240M');
        
        echo json_encode($this->M_expenseSubCategory->get_expenseSubCategory($id));
        
    }
}