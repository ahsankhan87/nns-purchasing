<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_positions extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_positions($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('hr_positions');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('hr_positions',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_positionsName($positions_id)
    {
       $query = $this->db->get_where('hr_positions',array('id'=>$positions_id));
      
       if($positionsName = $query->row())
        {
            return $positionsName->name;
        }
        return '';
    }
    
    function get_activepositions($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('hr_positions',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('hr_positions',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_positions()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('hr_positions',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"positions","added","POS");
            // end logging                    
    }
    
    function update_positions()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('hr_positions',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"positions","updated","POS");
            // end logging                     
    }
    function inactivate_positions($id)
    {
        $query = $this->db->update('hr_positions',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"positions","inactivated","POS");
            // end logging    
    }
    
    
    function delete_positions($id)
    {
        $query = $this->db->delete('hr_positions',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"positions","inactivated","POS");
            // end logging    
    }
    
    function get_activepositionsDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('hr_positions',array('status'=>1));
        
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