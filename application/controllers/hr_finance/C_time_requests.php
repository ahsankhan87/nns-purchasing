<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_time_requests extends MY_Controller{
    
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
        
        $data['title'] = 'List of time_requests';
        $data['main'] = 'List of time_requests';
        
        $data['time_requests'] = $this->M_time_requests->get_time_requests(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/time_requests/v_time_requests',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('date_issued', 'Date Issued', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'date_issued'=>$this->input->post('date_issued'),
                        'issued_by'=>$this->input->post('issued_by'),
                        'emp_id'=>$this->input->post('emp_id'),
                        'req_period_from'=>$this->input->post('req_period_from'),
                        'req_period_to'=>$this->input->post('req_period_to'),
                        'type'=>$this->input->post('type'),
                        'gm_approved'=>$this->input->post('gm_approved'),
                        'om_approved'=>$this->input->post('om_approved'),
                        'dm_approved'=>$this->input->post('dm_approved'),
                        'hr_noted'=>$this->input->post('hr_noted'),
                        'ac_noted'=>$this->input->post('ac_noted'),
                        'note'=>$this->input->post('note'),
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('hr_emp_time_requests',$data)) {
                    $this->session->set_flashdata('message','time_requests Added');
                    }else{
                    $data['flash_message'] = false;
                    }
                  
                
            //$this->M_time_requests->add_time_requests();
            
            redirect('hr_finance/C_time_requests','refresh');
        }
        }
        // $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['employeesDDL'] = $this->M_employees->getEmployeeDropDown();
        
        $data['title'] = 'Add New time_requests';
        $data['main'] = 'Add New time_requests';
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/time_requests/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('date_issued', 'Date Issued', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'date_issued'=>$this->input->post('date_issued'),
                        'issued_by'=>$this->input->post('issued_by'),
                        'emp_id'=>$this->input->post('emp_id'),
                        'req_period_from'=>$this->input->post('req_period_from'),
                        'req_period_to'=>$this->input->post('req_period_to'),
                        'type'=>$this->input->post('type'),
                        'gm_approved'=>$this->input->post('gm_approved'),
                        'om_approved'=>$this->input->post('om_approved'),
                        'dm_approved'=>$this->input->post('dm_approved'),
                        'hr_noted'=>$this->input->post('hr_noted'),
                        'ac_noted'=>$this->input->post('ac_noted'),
                        'note'=>$this->input->post('note'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('hr_emp_time_requests',$data,array('id'=>$_POST['id']))) {
                    $this->session->set_flashdata('message','time_requests Updated');
                    }else{
                    $data['flash_message'] = false;
                    }
                    
            //$this->M_time_requests->update_time_requests();
            //$this->session->set_flashdata('message','time_requests Updated');
            redirect('hr_finance/C_time_requests','refresh');
        }
        }
        $data['title'] = 'Update time_requests';
        $data['main'] = 'Update time_requests';
        
        $data['update_time_requests'] = $this->M_time_requests->get_time_requests($id);      
        //$data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['employeesDDL'] = $this->M_employees->getEmployeeDropDown();
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/time_requests/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $this->M_time_requests->delete_time_requests($id);
        $this->session->set_flashdata('message','time_requests Deleted');
        redirect('hr_finance/C_time_requests','refresh');
    }
}