<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_paymentfor extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_paymentfor($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_exp_paymentfor',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_exp_paymentfor',array('id'=>$id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_paymentforName($paymentfor_id)
    {
       $query = $this->db->get_where('finance_exp_paymentfor',array('id'=>$paymentfor_id,'company_id'=> $_SESSION['company_id']));
      
       if($paymentforName = $query->row())
        {
            return $paymentforName->name;
        }
        return '';
    }
    
    function get_activepaymentfor($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_exp_paymentfor',array('status'=>'active','company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_exp_paymentfor',array('id'=>$id,'status'=>'active','company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function add_paymentfor()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('finance_exp_paymentfor',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"paymentfor","added","POS");
            // end logging                    
    }
    
    function update_paymentfor()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('finance_exp_paymentfor',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"paymentfor","updated","POS");
            // end logging                     
    }
    function inactivate_paymentfor($id)
    {
        $query = $this->db->update('finance_exp_paymentfor',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"paymentfor","inactivated","POS");
            // end logging    
    }
    
    
    function delete_paymentfor($id)
    {
        $query = $this->db->delete('finance_exp_paymentfor',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"paymentfor","inactivated","POS");
            // end logging    
    }
    
    function get_activepaymentforDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('finance_exp_paymentfor',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
        if($query->num_rows() > 0)
        {
            foreach($query->result_array() as $row)
            {
                $data[$row['id']] = $row['name'];
            }
        }
        return $data;
    }
} 