<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_production_request extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_production_request($id = FALSE, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('date_created >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('date_created <=',$to_date);
        }
        
        if($id == FALSE)
        {
            $this->db->where('status != ','Quarantine');
            $this->db->where('status !=','Finished');
            $query = $this->db->get_where('prod_production_request');
            return $query->result_array();
        }
        
       $this->db->where('status != ','Quarantine');
       $this->db->where('status != ','Finished');
       $query = $this->db->get_where('prod_production_request',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_production_history($id = FALSE, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('date_created >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('date_created <=',$to_date);
        }
        
         if($id == FALSE)
        {
            $query = $this->db->get_where('prod_production_history');
            return $query->result_array();
        }
        
        $query = $this->db->get_where('prod_production_history',array('id'=>$id));
        return $query->result_array();
       
    }
    
    function get_production_requestName($production_request_id)
    {
       $query = $this->db->get_where('prod_production_request',array('id'=>$production_request_id));
      
       if($production_requestName = $query->row())
        {
            return $production_requestName->name;
        }
        return '';
    }
    
    function get_activeproduction_request($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('prod_production_request',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('prod_production_request',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_production_request()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('prod_production_request',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"production_request","added","POS");
            // end logging                    
    }
    
    function update_production_request()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('prod_production_request',$data,array('id'=>$_POST['id'])); 
        
                
    }
    function inactivate_production_request($id)
    {
        $query = $this->db->update('prod_production_request',array('status'=>'inactive'),array('id'=>$id));
        
        
    }
    
    
    function delete_production_request($id)
    {
        $query = $this->db->delete('prod_production_request',array('id'=>$id));
        
             
    }
    
    function delete_production_history($id)
    {
        $query = $this->db->delete('prod_production_history',array('id'=>$id));
        
             
    }
    function get_activeproduction_requestDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('prod_production_request',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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