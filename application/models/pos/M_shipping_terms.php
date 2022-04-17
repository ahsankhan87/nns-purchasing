<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_shipping_terms extends CI_Model{
    
    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_shipping_term($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('pos_shipping_terms',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_shipping_terms',array('id'=>$id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_shipping_termName($shipping_term_id)
    {
       $query = $this->db->get_where('pos_shipping_terms',array('id'=>$shipping_term_id,'company_id'=> $_SESSION['company_id']));
      
       if($shipping_termName = $query->row())
        {
            return $shipping_termName->name;
        }
        return '';
    }
    
    function get_activeshipping_terms($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('pos_shipping_terms',array('status'=>'active','company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_shipping_terms',array('id'=>$id,'status'=>'active','company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function add_shipping_term()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('pos_shipping_terms',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"shipping_term","added","POS");
            // end logging                    
    }
    
    function update_shipping_term()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('pos_shipping_terms',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"shipping_term","updated","POS");
            // end logging                     
    }
    function inactivate_shipping_term($id)
    {
        $query = $this->db->update('pos_shipping_terms',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"shipping_term","inactivated","POS");
            // end logging    
    }
    
    
    function delete_shipping_term($id)
    {
        $query = $this->db->delete('pos_shipping_terms',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"shipping_term","inactivated","POS");
            // end logging    
    }
    
    function get_activeshipping_termsDDL()
    {
        $data = array();
        $data[0] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('pos_shipping_terms',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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