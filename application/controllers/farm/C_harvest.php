<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_harvest extends MY_Controller{
    
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
        
        $data['title'] = 'List of Harvest';
        $data['main'] = 'List of Harvest';
        
        $data['harvest'] = $this->M_harvest->get_harvest(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/harvest/v_harvest',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('harvest_date', 'Harvest Date', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'harvest_date'=>$this->input->post('harvest_date'),
                        'pond_no'=>$this->input->post('pond_no'),
                        'unpressed_biomass'=>$this->input->post('unpressed_biomass'),
                        'pressed_biomass'=>$this->input->post('pressed_biomass'),
                        'unit_id'=>$this->input->post('unit_id'),
                        'status'=>$this->input->post('status'),
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('farm_harvest',$data)) {
                    $this->session->set_flashdata('message','Harvest Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_harvest->add_harvest();
            
            redirect('farm/C_harvest','refresh');
        }
        }
        // $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        
        $data['title'] = 'Add New harvest';
        $data['main'] = 'Add New harvest';
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/harvest/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('harvest_date', 'Harvest Date', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">×</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'harvest_date'=>$this->input->post('harvest_date'),
                        'pond_no'=>$this->input->post('pond_no'),
                        'unpressed_biomass'=>$this->input->post('unpressed_biomass'),
                        'pressed_biomass'=>$this->input->post('pressed_biomass'),
                        'unit_id'=>$this->input->post('unit_id'),
                        'status'=>$this->input->post('status'),
                        
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('farm_harvest',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Harvest Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_harvest->update_harvest();
            //$this->session->set_flashdata('message','harvest Updated');
            redirect('farm/C_harvest','refresh');
        }
        }
        $data['title'] = 'Update Harvest';
        $data['main'] = 'Update Harvest';
        
        $data['update_harvest'] = $this->M_harvest->get_harvest($id);      
        //$data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/harvest/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_harvest->delete_harvest($id);
        $this->session->set_flashdata('message','Harvest Deleted');
        redirect('farm/C_harvest','refresh');
    }
}