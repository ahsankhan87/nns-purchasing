<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_positions extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'List of Position';
        $data['main'] = 'List of Position';
        
        $data['positions'] = $this->M_positions->get_positions();
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/positions/v_positions',$data);
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
                  $data = array(  'name'=>$this->input->post('name'),
                        'status'=>1,
                        'note'=>$this->input->post('note'),
                        'date_created'=> date('Y-m-d H:i:s'),
                     );
                  
                  if($this->db->insert('finance_exp_positions',$data)) {
                    $this->session->set_flashdata('message','Position Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_positions->add_positions();
            
            redirect('hr_finance/C_positions','refresh');
        }
        }
        
        $data['title'] = 'Add New Position';
        $data['main'] = 'Add New Position';
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/positions/create',$data);
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
                  $data = array(  'name'=>$this->input->post('name'),
                  
                  'note'=>$this->input->post('note'),
                     );
                  
                  if($this->db->update('finance_exp_positions',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','Position Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_positions->update_positions();
            //$this->session->set_flashdata('message','positions Updated');
            redirect('hr_finance/C_positions','refresh');
        }
        }
        $data['title'] = 'Update Position';
        $data['main'] = 'Update Position';
        
        $data['update_positions'] = $this->M_positions->get_positions($id);      
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/menu/positions/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_positions->delete_positions($id);
        $this->session->set_flashdata('message','Position Deleted');
        redirect('hr_finance/C_positions','refresh');
    }

    //get all positions
    function positionsDDL($id=FALSE)
    {
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','100240M');
        
        echo json_encode($this->M_positions->get_positions($id));
        
    }
}