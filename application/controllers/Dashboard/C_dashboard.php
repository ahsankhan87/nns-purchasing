<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_dashboard extends MY_Controller{
  
  public function __construct()
    {
        parent::__construct();
        
        $this->load->helper('language');
        $this->lang->load('index');
    }
  
  public function index()
    {
        //$this->output->enable_profiler(true);
        $data = array('langs' => $this->session->userdata('lang'));
        
        $start_date = FY_START_DATE; //date("Y-m-d", strtotime("last year"));
        $to_date = FY_END_DATE; //date("Y-m-d");
        $fiscal_dates = "(From: ".date('d-m-Y',strtotime($start_date)) ." To:" .date('d-m-Y',strtotime($to_date)).")";
        
        ini_set('max_execution_time', 0); 
        ini_set('memory_limit','10240M');

        $data['title'] = lang('dashboard');
        $data['main'] = lang('home_searchBox');
        
        //$data['monthlyPurchaseReport']=  $this->M_dashboard->monthlyPurchaseReport($_SESSION["company_id"]);
        $data['PurchaseReport']=  $this->M_dashboard->PurchaseReport($_SESSION["company_id"],"",$start_date,$to_date);
        $data['PurchaseItemsReport']=  $this->M_dashboard->PurchaseItemsReport($_SESSION["company_id"],"",$start_date,$to_date);
        // $data['PurchaseByCurrency'] =  $this->M_dashboard->PurchaseByCurrency($_SESSION["company_id"],"",$start_date,$to_date);
        $data['claimsReport']=  $this->M_dashboard->claimsReport($_SESSION["company_id"],"",$start_date,$to_date);
        $data['logisticsReport']=  $this->M_dashboard->logisticsReport($_SESSION["company_id"],"",$start_date,$to_date);
        $data['sourcingReport']=  $this->M_dashboard->sourcingReport($_SESSION["company_id"],"",$start_date,$to_date);
        $data['sampleReport']=  $this->M_dashboard->sampleReport($_SESSION["company_id"],"",$start_date,$to_date);
        $data['purchase_request_report']=  $this->M_dashboard->purchaseRequestReport("",$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('v_dashboard',$data);
        $this->load->view('templates/footer');
    }
    
   function monthly_sale()
   {
        var_dump(json_encode($this->M_dashboard->month_sales($_SESSION["company_id"])));
   }
        
   function create_calendar()
   {
        //$this->output->enable_profiler();
        
        $start_date = '2016-01-01';
        $end_date = '2016-12-31';
        
        $this->M_pos_reports->fill_calendar($start_date, $end_date,$_SESSION['company_id']);
        
        //echo 'success';

   } 
}
 