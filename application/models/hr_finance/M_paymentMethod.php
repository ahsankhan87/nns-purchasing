<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_paymentMethod extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_paymentMethod($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_exp_paymentmethod',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_exp_paymentmethod',array('id'=>$id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_paymentMethodName($paymentMethod_id)
    {
       $query = $this->db->get_where('finance_exp_paymentmethod',array('id'=>$paymentMethod_id,'company_id'=> $_SESSION['company_id']));
      
       if($paymentMethodName = $query->row())
        {
            return $paymentMethodName->name;
        }
        return '';
    }
    
    function get_activepaymentMethod($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_exp_paymentmethod',array('status'=>'active','company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_exp_paymentmethod',array('id'=>$id,'status'=>'active','company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function add_paymentMethod()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('finance_exp_paymentmethod',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"paymentMethod","added","POS");
            // end logging                    
    }
    
    function update_paymentMethod()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('finance_exp_paymentmethod',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"paymentMethod","updated","POS");
            // end logging                     
    }
    function inactivate_paymentMethod($id)
    {
        $query = $this->db->update('finance_exp_paymentmethod',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"paymentMethod","inactivated","POS");
            // end logging    
    }
    
    
    function delete_paymentMethod($id)
    {
        $query = $this->db->delete('finance_exp_paymentmethod',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"paymentMethod","inactivated","POS");
            // end logging    
    }
    
    function get_activepaymentMethodDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('finance_exp_paymentmethod',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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