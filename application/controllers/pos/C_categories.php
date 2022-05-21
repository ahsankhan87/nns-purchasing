<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_categories extends MY_Controller{
    
    function __construct()
    {
       parent::__construct();
       $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        //$this->output->enable_profiler(true);
        
        $data['title'] = 'Categories';
        $data['main'] = 'Categories';
        
        //get all categories.
        $data['categories']= $this->M_category->get_category();
        
        //$data['check_cate'] = $this->M_category->get_category(16);
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/category/v_categories',$data);
        $this->load->view('templates/footer');
    }
    
    //get all categories
    function categoriesDDL($id=FALSE)
    {
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','100240M');
        
        echo json_encode($this->M_category->get_category($id));
        
    }

    function ProductsByCategory($category_id)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        //$this->output->enable_profiler(true);
        
        $data['title'] = 'Products';
        $data['main'] = 'Products';
        
        //get all categories.
        $data['products']= $this->M_items->get_items_by_category($category_id);
        
        //$data['check_cate'] = $this->M_category->get_category(16);
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/category/v_products',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->post('name'))
        {
            $this->M_category->addCategory();
            $this->session->set_flashdata('message','Category Created');
            redirect('pos/C_categories/index','refresh');
        }
        else
        {
            $data['title'] = 'Add New Category';
            $data['main'] = 'Add New Category';
            
            $data['categories'] = $this->M_category->getTopCategories();
            
            $this->load->view('templates/header',$data);
            $this->load->view('pos/category/create',$data);
            $this->load->view('templates/footer');
        }
    }
    
    //edit category
    public function edit($id=NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->post('name'))
        {
            $this->M_category->updateCategory();
            $this->session->set_flashdata('message','Category Updated');
            redirect('pos/C_categories/index','refresh');
        }
        else
        {
            $data['title'] = 'Update Category';
            $data['main'] = 'Update Category';
            
            $data['categories'] = $this->M_category->getTopCategories();
            $data['category'] = $this->M_category->get_category($id);
            
            $this->load->view('templates/header',$data);
            $this->load->view('pos/category/edit',$data);
            $this->load->view('templates/footer');
        }
    }
    
    function delete($id)
    {
       
        $orphan = $this->M_category->checkOrphanProducts($id);
        
        if(count($orphan))
        {
           $this->session->set_userdata('orphan',$orphan);
           redirect('pos/C_categories/reasign/'.$id,'refresh'); 
        }
        else
        {
            $this->M_category->deleteCategory($id);
           $this->session->set_flashdata('message','Category Deleted');
           redirect('pos/C_categories/index','refresh'); 
        }
        
        
    }
    
    function reasign($id=0)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if ($this->input->post('categories',true))
        {
            $this->M_items->reasign_items();
            $this->M_category->deleteCategory($id);
            $this->session->set_flashdata('message','Category deleted and products reassigned');
            redirect('pos/C_categories/index','refresh');
        }
            else{
            $data['category'] = $this->M_category->get_category($id);
            $data['title'] = 'Reassign Products';
            $data['main'] = 'Reassign Products';
            $data['category_id'] = $id;
            
            $data['categories'] = $this->M_category->getCategoriesDropDown();
            
            $this->load->view('templates/header',$data);
            $this->load->view('pos/category/reasign',$data);
            $this->load->view('templates/footer');
        }
    }
}