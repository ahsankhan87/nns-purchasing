<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_expenseSubCategory extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_expenseSubCategory($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_exp_subcategory',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_exp_subcategory',array('id'=>$id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_expenseSubCategoryName($expenseSubCategory_id)
    {
       $query = $this->db->get_where('finance_exp_subcategory',array('id'=>$expenseSubCategory_id,'company_id'=> $_SESSION['company_id']));
      
       if($expenseSubCategoryName = $query->row())
        {
            return $expenseSubCategoryName->name;
        }
        return '';
    }
    
    function get_activeexpenseSubCategory($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_exp_subcategory',array('status'=>'active','company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_exp_subcategory',array('id'=>$id,'status'=>'active','company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function add_expenseSubCategory()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('finance_exp_subcategory',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"expenseSubCategory","added","POS");
            // end logging                    
    }
    
    function update_expenseSubCategory()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('finance_exp_subcategory',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"expenseSubCategory","updated","POS");
            // end logging                     
    }
    function inactivate_expenseSubCategory($id)
    {
        $query = $this->db->update('finance_exp_subcategory',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"expenseSubCategory","inactivated","POS");
            // end logging    
    }
    
    
    function delete_expenseSubCategory($id)
    {
        $query = $this->db->delete('finance_exp_subcategory',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"expenseSubCategory","inactivated","POS");
            // end logging    
    }
    
    function get_activeexpenseSubCategoryDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('finance_exp_subcategory',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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