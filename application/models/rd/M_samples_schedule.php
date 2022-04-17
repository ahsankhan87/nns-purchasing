<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_samples_schedule extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_samples_schedule($id = FALSE, $from_date = null, $to_date=null)
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
            $query = $this->db->get_where('rd_samples_schedule');
            return $query->result_array();
        }
    
        $this->db->where('status != ','Finished');
            
       $query = $this->db->get_where('rd_samples_schedule',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_samples_scheduleName($samples_schedule_id)
    {
       $query = $this->db->get_where('rd_samples_schedule',array('id'=>$samples_schedule_id));
      
       if($samples_scheduleName = $query->row())
        {
            return $samples_scheduleName->name;
        }
        return '';
    }
    
    function get_activesamples_schedule($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('rd_samples_schedule',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('rd_samples_schedule',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_samples_schedule()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('rd_samples_schedule',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"samples_schedule","added","POS");
            // end logging                    
    }
    
    function update_samples_schedule()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('rd_samples_schedule',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"samples_schedule","updated","POS");
            // end logging                     
    }
    function inactivate_samples_schedule($id)
    {
        $query = $this->db->update('rd_samples_schedule',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"samples_schedule","inactivated","POS");
            // end logging    
    }
    
    
    function delete_samples_schedule($id)
    {
        $query = $this->db->delete('rd_samples_schedule',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"samples_schedule","inactivated","POS");
            // end logging    
    }
    
    function get_activesamples_scheduleDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('rd_samples_schedule',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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