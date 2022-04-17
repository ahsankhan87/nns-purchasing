<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_samples_request extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_samples_request($id = FALSE, $from_date = null, $to_date=null)
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
            $this->db->where('status != ','Finished');
            $query = $this->db->get_where('prod_samples_request');
            return $query->result_array();
        }
        // $this->db->where('status != ','Finished');
       $query = $this->db->get_where('prod_samples_request',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_rd_history($id = FALSE)
    {
         if($id == FALSE)
        {
            $query = $this->db->get_where('rd_samples_history');
            return $query->result_array();
        }
        
        $query = $this->db->get_where('rd_samples_history',array('id'=>$id));
        return $query->result_array();
       
    }
    
    function get_samples_request_by_status($status)
    {
       $query = $this->db->get_where('prod_samples_request',array('status'=>$status));
       return $query->result_array();
    }
    
    function get_samples_requestName($samples_request_id)
    {
       $query = $this->db->get_where('prod_samples_request',array('id'=>$samples_request_id));
      
       if($samples_requestName = $query->row())
        {
            return $samples_requestName->name;
        }
        return '';
    }
    
    function get_activesamples_request($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('prod_samples_request',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('prod_samples_request',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_samples_request()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('prod_samples_request',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"samples_request","added","POS");
            // end logging                    
    }
    
    function update_samples_request()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('prod_samples_request',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"samples_request","updated","POS");
            // end logging                     
    }
    function inactivate_samples_request($id)
    {
        $query = $this->db->update('prod_samples_request',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"samples_request","inactivated","POS");
            // end logging    
    }
    
    
    function delete_samples_request($id)
    {
        $query = $this->db->delete('prod_samples_request',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"samples_request","inactivated","POS");
            // end logging    
    }
    
    function delete_samples_history($id)
    {
        $query = $this->db->delete('rd_samples_history',array('id'=>$id));
           
    }
    
    function get_activesamples_requestDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('prod_samples_request',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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