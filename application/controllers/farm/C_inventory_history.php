<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_inventory_history extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    } 
    
    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'Inventory History';
        $data['main'] = 'Inventory History';
        
        $data['inventory'] = $this->M_inventory->get_inventory_history();
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/inventory/v_inventory_history',$data);
        $this->load->view('templates/footer');
    }
    
    
}