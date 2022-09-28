<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_time_requests extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_time_requests($id = FALSE, $from_date = null, $to_date=null)
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
            $query = $this->db->get_where('hr_emp_time_requests');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('hr_emp_time_requests',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_time_requests_report($from_date=null,$to_date=null,$status)
    {
       if($status != 'All'){
            $this->db->where("fsms",$status);
        }
        
       if($from_date != null && $to_date != null){
            $this->db->where("time_requests_date BETWEEN '$from_date' AND '$to_date'");
        }
        
    //   $this->db->select('requests_date,pond_no,unit_id,SUM(qty) as total_qty');
      $this->db->group_by('pond_no');
       
       $query = $this->db->get('hr_emp_time_requests');
       return $query->result_array();
    }
    
    function get_time_requestsName($time_requests_id)
    {
       $query = $this->db->get_where('hr_emp_time_requests',array('id'=>$time_requests_id));
      
       if($time_requestsName = $query->row())
        {
            return $time_requestsName->name;
        }
        return '';
    }
    
    function get_activetime_requests($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('hr_emp_time_requests',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('hr_emp_time_requests',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_time_requests()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('hr_emp_time_requests',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"time_requests","added","POS");
            // end logging                    
    }
    
    function update_time_requests()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('hr_emp_time_requests',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"time_requests","updated","POS");
            // end logging                     
    }
    function inactivate_time_requests($id)
    {
        $query = $this->db->update('hr_emp_time_requests',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"time_requests","inactivated","POS");
            // end logging    
    }
    
    
    function delete_time_requests($id)
    {
        $query = $this->db->delete('hr_emp_time_requests',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"time_requests","inactivated","POS");
            // end logging    
    }
    
    function get_activetime_requestsDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('hr_emp_time_requests',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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