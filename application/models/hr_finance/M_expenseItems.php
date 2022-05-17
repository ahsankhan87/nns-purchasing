<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_expenseItems extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_expenseItems($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_exp_items',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_exp_items',array('id'=>$id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_expenseItemsName($expenseItems_id)
    {
       $query = $this->db->get_where('finance_exp_items',array('id'=>$expenseItems_id,'company_id'=> $_SESSION['company_id']));
      
       if($expenseItemsName = $query->row())
        {
            return $expenseItemsName->name;
        }
        return '';
    }
    
    function get_activeexpenseItems($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_exp_items',array('status'=>'active','company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_exp_items',array('id'=>$id,'status'=>'active','company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function add_expenseItems()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('finance_exp_items',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"expenseItems","added","POS");
            // end logging                    
    }
    
    function update_expenseItems()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('finance_exp_items',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"expenseItems","updated","POS");
            // end logging                     
    }
    function inactivate_expenseItems($id)
    {
        $query = $this->db->update('finance_exp_items',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"expenseItems","inactivated","POS");
            // end logging    
    }
    
    
    function delete_expenseItems($id)
    {
        $query = $this->db->delete('finance_exp_items',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"expenseItems","inactivated","POS");
            // end logging    
    }
    
    function get_activeexpenseItemsDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('finance_exp_items',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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