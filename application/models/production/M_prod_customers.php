<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_prod_customers extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_prod_customer($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('prod_customers');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('prod_customers',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_prod_customerName($prod_customer_id)
    {
       $query = $this->db->get_where('prod_customers',array('id'=>$prod_customer_id));
      
       if($prod_customerName = $query->row())
        {
            return $prod_customerName->name;
        }
        return '';
    }

    function get_prod_customer_payments($prod_customer_id){
        $query = $this->db->get_where('prod_customer_payments',array('customer_id'=>$prod_customer_id));
       return $query->result_array();
    }
    
    function get_activeprod_customers($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('prod_customers',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('prod_customers',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_prod_customer()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('prod_customers',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"prod_customer","added","POS");
            // end logging                    
    }
    
    function update_prod_customer()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('prod_customers',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"prod_customer","updated","POS");
            // end logging                     
    }
    function inactivate_prod_customer($id)
    {
        $query = $this->db->update('prod_customers',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"prod_customer","inactivated","POS");
            // end logging    
    }
    
    
    function delete_prod_customer($id)
    {
        $query = $this->db->delete('prod_customers',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"prod_customer","inactivated","POS");
            // end logging    
    }
    
    function get_prod_customersDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('prod_customers');
        
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