<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_payment_terms extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_payment_terms($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_sales_pay_terms');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_sales_pay_terms',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_payment_termsName($payment_terms_id)
    {
       $query = $this->db->get_where('finance_sales_pay_terms',array('id'=>$payment_terms_id));
      
       if($payment_termsName = $query->row())
        {
            return $payment_termsName->name;
        }
        return '';
    }
    
    function get_activepayment_terms($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_sales_pay_terms',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_sales_pay_terms',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_payment_terms()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('finance_sales_pay_terms',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"payment_terms","added","POS");
            // end logging                    
    }
    
    function update_payment_terms()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('finance_sales_pay_terms',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"payment_terms","updated","POS");
            // end logging                     
    }
    function inactivate_payment_terms($id)
    {
        $query = $this->db->update('finance_sales_pay_terms',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"payment_terms","inactivated","POS");
            // end logging    
    }
    
    
    function delete_payment_terms($id)
    {
        $query = $this->db->delete('finance_sales_pay_terms',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"payment_terms","inactivated","POS");
            // end logging    
    }
    
    function get_activepayment_termsDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('finance_sales_pay_terms',array('status'=>'active'));
        
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