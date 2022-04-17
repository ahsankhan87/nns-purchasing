<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_products extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Products';
        $data['main'] = 'List of Products';
        
        $data['products'] = $this->M_products->get_product();
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/products/v_products',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('name', 'Name', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'brand'=>$this->input->post('brand'),
                        'name'=>$this->input->post('name'),
                        'item_number'=>$this->input->post('item_number'),
                        'content'=>$this->input->post('content'),
                        'packaging'=>$this->input->post('packaging'),
                        'current_stock'=>$this->input->post('current_stock'),
                        'fda_validity'=>$this->input->post('fda_validity'),
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('prod_products',$data)) {
                    $this->session->set_flashdata('message','Product Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_products->add_product();
            
            redirect('production/C_products','refresh');
        }
        }
        
        $data['title'] = 'Add New Product';
        $data['main'] = 'Add New Product';
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/products/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('name', 'Name', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'brand'=>$this->input->post('brand'),
                        'name'=>$this->input->post('name'),
                        'item_number'=>$this->input->post('item_number'),
                        'content'=>$this->input->post('content'),
                        'packaging'=>$this->input->post('packaging'),
                        'current_stock'=>$this->input->post('current_stock'),
                        'fda_validity'=>$this->input->post('fda_validity'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('prod_products',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Product Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_products->update_product();
            //$this->session->set_flashdata('message','product Updated');
            redirect('production/C_products','refresh');
        }
        }
        $data['title'] = 'Update Products';
        $data['main'] = 'Update Products';
        
        $data['update_product'] = $this->M_products->get_product($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('production/products/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_products->delete_product($id);
        $this->session->set_flashdata('message','Product Deleted');
        redirect('production/C_products','refresh');
    }
}