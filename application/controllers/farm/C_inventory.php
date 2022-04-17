<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_inventory extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Inventory';
        $data['main'] = 'List of Inventory';
        
        $data['inventory'] = $this->M_inventory->get_inventory();
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/inventory/v_inventory',$data);
        $this->load->view('templates/footer');
    }
    
    function detail($id)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'Inventory Detail';
        $data['main'] = 'Inventory Detail';
        
        $data['inventory'] = $this->M_inventory->get_inventory_by_product_id($id);
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/inventory/v_detail',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('item_id', 'Item', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'prod_product_id'=>$this->input->post('item_id'),
                        'ibn'=>$this->input->post('ibn'),
                        'in_qty'=>$this->input->post('in_qty'),
                        'moq'=>$this->input->post('moq'),
                        'in_date'=>$this->input->post('in_date'),
                        'waste'=>$this->input->post('waste'),
                        'status'=>$this->input->post('status'),
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('farm_inventory',$data)) {
                    $this->session->set_flashdata('message','Inventory Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_inventory->add_inventory();
            
            redirect('farm/C_inventory','refresh');
        }
        }
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        // $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        
        $data['title'] = 'Add New Inventory';
        $data['main'] = 'Add New Inventory';
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/inventory/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('item_id', 'Item', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'prod_product_id'=>$this->input->post('item_id'),
                        'ibn'=>$this->input->post('ibn'),
                        'in_qty'=>$this->input->post('in_qty'),
                        'moq'=>$this->input->post('moq'),
                        'in_date'=>$this->input->post('in_date'),
                        'waste'=>$this->input->post('waste'),
                        'status'=>$this->input->post('status'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('farm_inventory',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Inventory Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_inventory->update_inventory();
            //$this->session->set_flashdata('message','inventory Updated');
            redirect('farm/C_inventory','refresh');
        }
        }
        $data['title'] = 'Update Inventory';
        $data['main'] = 'Update Inventory';
        
        $data['update_inventory'] = $this->M_inventory->get_inventory($id);      
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        // $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/inventory/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_inventory->delete_inventory($id);
        $this->M_inventory->delete_inventory_detail($id);
         
        $this->session->set_flashdata('message','Inventory Deleted');
        redirect('farm/C_inventory','refresh');
    }
}