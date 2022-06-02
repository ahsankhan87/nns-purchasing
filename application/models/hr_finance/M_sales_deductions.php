<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_sales_deductions extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_sales_deductions($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_deductions');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_deductions',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_sales_deductionsName($sales_deductions_id)
    {
       $query = $this->db->get_where('finance_deductions',array('id'=>$sales_deductions_id));
      
       if($sales_deductionsName = $query->row())
        {
            return $sales_deductionsName->name;
        }
        return '';
    }
    
    function get_activesales_deductions($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_deductions',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_deductions',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_sales_deductions()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('finance_deductions',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"sales_deductions","added","POS");
            // end logging                    
    }
    
    function update_sales_deductions()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                        'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('finance_deductions',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"sales_deductions","updated","POS");
            // end logging                     
    }
    function inactivate_sales_deductions($id)
    {
        $query = $this->db->update('finance_deductions',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"sales_deductions","inactivated","POS");
            // end logging    
    }
    
    
    function delete_sales_deductions($id)
    {
        $query = $this->db->delete('finance_deductions',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"sales_deductions","inactivated","POS");
            // end logging    
    }
    
    function get_activesales_deductionsDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('finance_deductions',array('status'=>'active'));
        
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