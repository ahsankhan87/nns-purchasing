<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_logisticsReport extends MY_Controller{
     
    public function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    }
    
    
    public function index(){
        
        $data = array('langs' => $this->session->userdata('lang'));
        
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','10240M');

        $data['title'] = 'Logistics Fees Report';
        $data['main'] = 'Logistics Fees Report';
        
        $data['from_date'] = ($this->input->post('from_date') ? $this->input->post('from_date') : 0);
        $data['to_date'] = ($this->input->post('to_date') ? $this->input->post('to_date') : 0);
        $data['status'] = ($this->input->post('status') ? $this->input->post('status') : 'All');
        
        if($data['from_date'] && $data['to_date'])
        {
            $data['logistics'] = $this->M_logistics_fees->get_logistics_report($data['from_date'],$data['to_date'],$data['status']);    
        }
        
        
        $this->load->view('templates/header',$data);
        $this->load->view('reports/receivings/logistics_report',$data);
        $this->load->view('templates/footer');
    }
}