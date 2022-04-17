<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_incomingProducts extends MY_Controller{
    
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
        
        $data['title'] = 'Incoming Products';
        $data['main'] = 'Incoming Products';
        
        $data['incoming_products']=  $this->M_dashboard->PurchaseItemsReport($_SESSION["company_id"],'',$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('pos/incoming_products/v_incoming_products',$data);
        $this->load->view('templates/footer');
    }
    
}