<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_sales_charges extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_sales_charges($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_charges');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_charges',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_sales_chargesName($sales_charges_id)
    {
       $query = $this->db->get_where('finance_charges',array('id'=>$sales_charges_id));
      
       if($sales_chargesName = $query->row())
        {
            return $sales_chargesName->name;
        }
        return '';
    }
    
    function get_activesales_charges($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_charges',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_charges',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_sales_charges()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('finance_charges',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"sales_charges","added","POS");
            // end logging                    
    }
    
    function update_sales_charges()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('finance_charges',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"sales_charges","updated","POS");
            // end logging                     
    }
    function inactivate_sales_charges($id)
    {
        $query = $this->db->update('finance_charges',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"sales_charges","inactivated","POS");
            // end logging    
    }
    
    
    function delete_sales_charges($id)
    {
        $query = $this->db->delete('finance_charges',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"sales_charges","inactivated","POS");
            // end logging    
    }
    
    function get_activesales_chargesDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('finance_charges',array('status'=>'active'));
        
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