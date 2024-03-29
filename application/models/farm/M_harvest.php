<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_harvest extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_harvest($id = FALSE, $from_date = null, $to_date=null)
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
            $query = $this->db->get_where('farm_harvest');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('farm_harvest',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_harvest_date($from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('date_created >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('date_created <=',$to_date);
        }
        
        $this->db->select("harvest_date");
        $query = $this->db->get_where('farm_harvest');
        return $query->result_array();
       
    }
    
    function get_harvest_report($from_date=null,$to_date=null,$status)
    {
       if($status != 'All'){
            $this->db->where("status",$status);
        }
        
       if($from_date != null && $to_date != null){
            $this->db->where("harvest_date BETWEEN '$from_date' AND '$to_date'");
        }
        
      $this->db->select('pond_no,unit_id,SUM(unpressed_biomass) as unpressed_biomass,SUM(pressed_biomass) as pressed_biomass,status');
      $this->db->group_by('pond_no');
       
       $query = $this->db->get('farm_harvest');
       return $query->result_array();
    }
    
    function get_harvestName($harvest_id)
    {
       $query = $this->db->get_where('farm_harvest',array('id'=>$harvest_id));
      
       if($harvestName = $query->row())
        {
            return $harvestName->name;
        }
        return '';
    }
    
    function get_activeharvest($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('farm_harvest',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('farm_harvest',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_harvest()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('farm_harvest',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"harvest","added","POS");
            // end logging                    
    }
    
    function update_harvest()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('farm_harvest',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"harvest","updated","POS");
            // end logging                     
    }
    function inactivate_harvest($id)
    {
        $query = $this->db->update('farm_harvest',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"harvest","inactivated","POS");
            // end logging    
    }
    
    
    function delete_harvest($id)
    {
        $query = $this->db->delete('farm_harvest',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"harvest","inactivated","POS");
            // end logging    
    }
    
    function get_activeharvestDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('farm_harvest',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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