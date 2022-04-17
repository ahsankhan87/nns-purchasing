<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_sourcings extends CI_Model{ 
    
    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_sourcing($id = FALSE, $from_date = null, $to_date=null)
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
            $query = $this->db->get_where('pos_sourcings',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_sourcings',array('id'=>$id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_sourcingName($sourcing_id)
    {
       $query = $this->db->get_where('pos_sourcings',array('id'=>$sourcing_id,'company_id'=> $_SESSION['company_id']));
      
       if($sourcingName = $query->row())
        {
            return $sourcingName->name;
        }
        return '';
    }
    
    function get_activesourcings($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('pos_sourcings',array('status'=>'active','company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_sourcings',array('id'=>$id,'status'=>'active','company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function add_sourcing()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('pos_sourcings',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"sourcing","added","POS");
            // end logging                    
    }
    
    function update_sourcing()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('pos_sourcings',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"sourcing","updated","POS");
            // end logging                     
    }
    
    function delete_sourcing($id)
    {
        //$query = $this->db->update('pos_sourcings',array('status'=>'inactive'),array('id'=>$id));
        $query = $this->db->delete('pos_sourcings',array('id'=>$id));
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"sourcing","inactivated","POS");
            // end logging    
    }
    
    function get_activesourcingsDDL()
    {
        $data = array();
        $data[0] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('pos_sourcings',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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