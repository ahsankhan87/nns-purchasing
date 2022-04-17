<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_samples extends MY_Controller{
    
    function __construct()
    {
        parent::__construct(); 
        $this->lang->load('index');
    }
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $start_date = FY_START_DATE; //date("Y-m-d", strtotime("last year"));
        $to_date = FY_END_DATE; //date("Y-m-d");
        $fiscal_dates = "(From: ".date('d-m-Y',strtotime($start_date)) ." To:" .date('d-m-Y',strtotime($to_date)).")";
        
        $fy_start_datetime = date('Y-m-d H:i:s',strtotime($start_date));
        $fy_to_datetime = date('Y-m-d H:i:s',strtotime($to_date));
        
        $data['title'] = 'Samples';
        $data['main'] = 'Samples';
        
        $data['samples'] = $this->M_samples->get_sample(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/samples/v_samples',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('item', 'Product', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                      'item'=>$this->input->post('item'),
                      'supplier'=>$this->input->post('supplier'),
                      'qty'=>$this->input->post('qty'),
                      'unit_id'=>$this->input->post('unit_id'),
                      'price'=>$this->input->post('price'),
                      'currency'=>$this->input->post('currency'),
                      'department_id'=>$this->input->post('department_id'),
                      'approval'=>$this->input->post('approval'),
                      'payment_status'=>$this->input->post('payment_status'),
                      'delivery_status'=>$this->input->post('delivery_status'),
                      'company_id'=> $_SESSION['company_id'],
                      'date_created'=>date("Y-m-d"),
                     );
                  
                  if($this->db->insert('pos_samples',$data)) {
                    $this->session->set_flashdata('message','Sample Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_samples->add_sample();
            
            redirect('trans/C_samples/index','refresh');
        }
        }
        
        $data['title'] = 'Add New sample';
        $data['main'] = 'Add New sample';
        
        $data['supplierDDL'] = $this->M_suppliers->getSupplierDropDown();
        $data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
        $data['productsDDL'] = $this->M_items->getItemDropDown();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
            
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/samples/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('item', 'Product', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                      'item'=>$this->input->post('item'),
                      'supplier'=>$this->input->post('supplier'),
                      'qty'=>$this->input->post('qty'),
                      'unit_id'=>$this->input->post('unit_id'),
                      'price'=>$this->input->post('price'),
                      'currency'=>$this->input->post('currency'),
                      'department_id'=>$this->input->post('department_id'),
                      'approval'=>$this->input->post('approval'),
                      'payment_status'=>$this->input->post('payment_status'),
                      'delivery_status'=>$this->input->post('delivery_status'),
                     );
                  
                  if($this->db->update('pos_samples',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Sample Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_samples->update_sample();
            //$this->session->set_flashdata('message','sample Updated');
            redirect('trans/C_samples/index','refresh');
        }
        }
        $data['title'] = 'Update Sample';
        $data['main'] = 'Update Sample';
        
        $data['update_sample'] = $this->M_samples->get_sample($id);      
        $data['supplierDDL'] = $this->M_suppliers->getSupplierDropDown();
        $data['categoryDDL'] = $this->M_category->getCategoriesDropDown();
        $data['productsDDL'] = $this->M_items->getItemDropDown();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/samples/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_samples->delete_sample($id);
        $this->session->set_flashdata('message','Sample Deleted');
        redirect('trans/C_samples/index','refresh');
    }
}