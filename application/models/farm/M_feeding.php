<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_feeding extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_feeding($id = FALSE, $from_date = null, $to_date=null)
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
            $query = $this->db->get_where('farm_feeding');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('farm_feeding',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_feeding_report($from_date=null,$to_date=null)
    {
       
       if($from_date != null && $to_date != null){
            $this->db->where("date BETWEEN '$from_date' AND '$to_date'");
        }
        
       $this->db->select('date,item_id,unit_id,SUM(ibn_qty_1+ibn_qty_2+ibn_qty_3) as total_qty');
       $this->db->group_by('item_id, unit_id');
       
       $query = $this->db->get('farm_feeding');
       return $query->result_array();
    }
    
    function get_feeding_by_ibn($ibn)
    {
    //   $this->db->where_or('ibn_1',$ibn);
      $this->db->or_where('ibn_2',$ibn);
      $this->db->or_where('ibn_3',$ibn);
       
       $query = $this->db->get_where('farm_feeding',array('ibn_1'=>$ibn));
       return $query->result_array();
    }
    
    function get_feedingName($feeding_id)
    {
       $query = $this->db->get_where('farm_feeding',array('id'=>$feeding_id));
      
       if($feedingName = $query->row())
        {
            return $feedingName->name;
        }
        return '';
    }
    
    function get_activefeeding($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('farm_feeding',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('farm_feeding',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_feeding()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('farm_feeding',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"feeding","added","POS");
            // end logging                    
    }
    
    function update_feeding()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('farm_feeding',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"feeding","updated","POS");
            // end logging                     
    }
    function inactivate_feeding($id)
    {
        $query = $this->db->update('farm_feeding',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"feeding","inactivated","POS");
            // end logging    
    }
    
    
    function delete_feeding($id)
    {
        $query = $this->db->delete('farm_feeding',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"feeding","inactivated","POS");
            // end logging    
    }
    
    function get_activefeedingDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('farm_feeding',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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