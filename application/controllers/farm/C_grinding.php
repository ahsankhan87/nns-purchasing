<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_grinding extends MY_Controller{
    
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
        
        $data['title'] = 'List of Grinding';
        $data['main'] = 'List of Grinding';
        
        $data['grinding'] = $this->M_grinding->get_grinding(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/grinding/v_grinding',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('harvest_date', 'Harvest Date', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'harvest_date'=>$this->input->post('harvest_date'),
                        'grinding_date'=>$this->input->post('grinding_date'),
                        'qty'=>$this->input->post('qty'),
                        'pond_no'=>$this->input->post('pond_no'),
                        'batch_code'=>$this->input->post('batch_code'),
                        'fsms'=>$this->input->post('fsms'),
                        'delivery_date'=>($this->input->post('delivery_date') == '' ? 'no date yet' : $this->input->post('delivery_date')),
                        'unit_id'=>$this->input->post('unit_id'),
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('farm_grinding',$data)) {
                    $this->session->set_flashdata('message','Grinding Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_grinding->add_grinding();
            
            redirect('farm/C_grinding','refresh');
        }
        }
        // $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        
        $data['title'] = 'Add New Grinding';
        $data['main'] = 'Add New Grinding';
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/grinding/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('harvest_date', 'Harvest Date', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'harvest_date'=>$this->input->post('harvest_date'),
                        'grinding_date'=>$this->input->post('grinding_date'),
                        'qty'=>$this->input->post('qty'),
                        'pond_no'=>$this->input->post('pond_no'),
                        'batch_code'=>$this->input->post('batch_code'),
                        'fsms'=>$this->input->post('fsms'),
                        'delivery_date'=>$this->input->post('delivery_date'),
                        'unit_id'=>$this->input->post('unit_id'),
                        
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('farm_grinding',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Grinding Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_grinding->update_grinding();
            //$this->session->set_flashdata('message','grinding Updated');
            redirect('farm/C_grinding','refresh');
        }
        }
        $data['title'] = 'Update Grinding';
        $data['main'] = 'Update Grinding';
        
        $data['update_grinding'] = $this->M_grinding->get_grinding($id);      
        //$data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/grinding/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_grinding->delete_grinding($id);
        $this->session->set_flashdata('message','Grinding Deleted');
        redirect('farm/C_grinding','refresh');
    }
}