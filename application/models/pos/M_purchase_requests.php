<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_purchase_requests extends CI_Model{
    
    function __construct()
    { 
        parent::__construct();
        $this->load->database();
    }
    
    function get_purchase_request($id = FALSE, $from_date = null, $to_date=null)
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
            $this->db->where('status != ','PO Made');
            $query = $this->db->get_where('pos_purchase_requests');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_purchase_requests',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_purchase_requestName($purchase_request_id)
    {
       $query = $this->db->get_where('pos_purchase_requests',array('id'=>$purchase_request_id));
      
       if($purchase_requestName = $query->row())
        {
            return $purchase_requestName->name;
        }
        return '';
    }
    
    function get_activepurchase_requests($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('pos_purchase_requests',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_purchase_requests',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_purchase_request()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('pos_purchase_requests',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"purchase_request","added","POS");
            // end logging                    
    }
    
    function update_purchase_request()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('pos_purchase_requests',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"purchase_request","updated","POS");
            // end logging                     
    }
    
    function delete_purchase_request($id)
    {
        //$query = $this->db->update('pos_purchase_requests',array('status'=>'inactive'),array('id'=>$id));
        $query = $this->db->delete('pos_purchase_requests',array('id'=>$id));
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"purchase_request","inactivated","POS");
            // end logging    
    }
    
    function get_activepurchase_requestsDDL()
    {
        $data = array();
        $data[0] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('pos_purchase_requests',array('status'=>'active'));
        
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