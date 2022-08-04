<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_feedingReport extends MY_Controller{
     
    public function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    }
    
    
    public function index(){
        
        $data = array('langs' => $this->session->userdata('lang'));
        
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','10240M');

        $data['title'] = 'Feeding Report';
        $data['main'] = 'Feeding Report';
        
        $data['from_date'] = ($this->input->post('from_date') ? $this->input->post('from_date') : 0);
        $data['to_date'] = ($this->input->post('to_date') ? $this->input->post('to_date') : 0);
        // $data['status'] = ($this->input->post('status') ? $this->input->post('status') : 'All');
        echo $data['from_date'] ;
        
        if($data['from_date'] && $data['to_date'])
        {
            $data['feeding'] = $this->M_feeding->get_feeding_report($data['from_date'],$data['to_date']);    
        }
        
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/feeding/feeding_report',$data);
        $this->load->view('templates/footer');
    }
}