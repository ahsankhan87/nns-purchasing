<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_grinding extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_grinding($id = FALSE, $from_date = null, $to_date=null)
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
            $query = $this->db->get_where('farm_grinding');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('farm_grinding',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_grinding_report($from_date=null,$to_date=null,$status)
    {
       if($status != 'All'){
            $this->db->where("fsms",$status);
        }
        
       if($from_date != null && $to_date != null){
            $this->db->where("grinding_date BETWEEN '$from_date' AND '$to_date'");
        }
        
      $this->db->select('grinding_date,pond_no,unit_id,SUM(qty) as total_qty');
      $this->db->group_by('pond_no');
       
       $query = $this->db->get('farm_grinding');
       return $query->result_array();
    }
    
    function get_grindingName($grinding_id)
    {
       $query = $this->db->get_where('farm_grinding',array('id'=>$grinding_id));
      
       if($grindingName = $query->row())
        {
            return $grindingName->name;
        }
        return '';
    }
    
    function get_activegrinding($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('farm_grinding',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('farm_grinding',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_grinding()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('farm_grinding',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"grinding","added","POS");
            // end logging                    
    }
    
    function update_grinding()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('farm_grinding',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"grinding","updated","POS");
            // end logging                     
    }
    function inactivate_grinding($id)
    {
        $query = $this->db->update('farm_grinding',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"grinding","inactivated","POS");
            // end logging    
    }
    
    
    function delete_grinding($id)
    {
        $query = $this->db->delete('farm_grinding',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"grinding","inactivated","POS");
            // end logging    
    }
    
    function get_activegrindingDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('farm_grinding',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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