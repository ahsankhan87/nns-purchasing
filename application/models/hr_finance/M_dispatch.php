<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_dispatch extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_dispatch($id = FALSE, $from_date = null, $to_date=null)
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
            $query = $this->db->get_where('finance_dispatch');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_dispatch',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_dispatch_report($from_date=null,$to_date=null,$status)
    {
       if($status != 'All'){
            $this->db->where("fsms",$status);
        }
        
       if($from_date != null && $to_date != null){
            $this->db->where("dispatch_date BETWEEN '$from_date' AND '$to_date'");
        }
        
    //   $this->db->select('requests_date,pond_no,unit_id,SUM(qty) as total_qty');
      $this->db->group_by('pond_no');
       
       $query = $this->db->get('finance_dispatch');
       return $query->result_array();
    }
    
    function get_dispatchName($dispatch_id)
    {
       $query = $this->db->get_where('finance_dispatch',array('id'=>$dispatch_id));
      
       if($dispatchName = $query->row())
        {
            return $dispatchName->name;
        }
        return '';
    }
    
    function get_activedispatch($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('finance_dispatch',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_dispatch',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_dispatch()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('finance_dispatch',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"dispatch","added","POS");
            // end logging                    
    }
    
    function update_dispatch()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('finance_dispatch',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"dispatch","updated","POS");
            // end logging                     
    }
    function inactivate_dispatch($id)
    {
        $query = $this->db->update('finance_dispatch',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"dispatch","inactivated","POS");
            // end logging    
    }
    
    
    function delete_dispatch($id)
    {
        $query = $this->db->delete('finance_dispatch',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"dispatch","inactivated","POS");
            // end logging    
    }
    
    function get_activedispatchDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('finance_dispatch',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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