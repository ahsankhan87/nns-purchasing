<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_products extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_product($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('prod_products');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('prod_products',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_productName($product_id)
    {
       $query = $this->db->get_where('prod_products',array('id'=>$product_id));
      
       if($productName = $query->row())
        {
            return $productName->name;
        }
        return '';
    }
     //check the item option i.e item_id, color and size if exist
     public function is_item_exist($item_id = 0)
     {
         $query = $this->db->get_where('prod_products',array('id'=>$item_id));
         
         if($query->num_rows() > 0)
         {
             return true;
         }
         else
         {
             return false;
         }
             
     }
    function get_activeproducts($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('prod_products',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('prod_products',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_product()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('prod_products',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"product","added","POS");
            // end logging                    
    }
    
    function update_product()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('prod_products',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"product","updated","POS");
            // end logging                     
    }
    function inactivate_product($id)
    {
        $query = $this->db->update('prod_products',array('status'=>'inactive'),array('id'=>$id));
        
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"product","inactivated","POS");
            // end logging    
    }
    
    
    function delete_product($id)
    {
        $query = $this->db->delete('prod_products',array('id'=>$id));
        
            //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"product","inactivated","POS");
            // end logging    
    }
    
    function get_productsDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('prod_products');
        
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