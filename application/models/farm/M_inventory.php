<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_inventory extends CI_Model{
    
    function __construct() 
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_inventory($id = FALSE)
    {
        if($id == FALSE)
        {
            $this->db->select('id,prod_product_id,ibn,in_qty,in_date,waste,out_qty,(in_qty-out_qty) as balance,status,out_date,moq');
            $this->db->group_by('id');
            $this->db->having('sum(in_qty-out_qty) > 0');
            $query = $this->db->get('farm_inventory');
            return $query->result_array();
        }
        
        $this->db->select('id,prod_product_id,ibn,in_qty,in_date,waste,out_qty,(in_qty-out_qty) as balance,status,out_date,moq');
       $query = $this->db->get_where('farm_inventory',array('id'=>$id));
       return $query->result_array();
    }
    
    function get_inventory_detail($inventory_id = FALSE)
    {
        // $this->db->select('id,prod_product_id,ibn,in_qty,out_qty,(in_qty-out_qty) as balance,out_date,moq');
       $query = $this->db->get_where('farm_inventory_detail',array('inventory_id'=>$inventory_id));
       return $query->result_array();
    }
     
    function get_inventory_history()
    {
        
        $this->db->select('id,prod_product_id,ibn,in_qty,in_date,waste,out_qty,(in_qty-out_qty) as balance,status,out_date,moq');
        $this->db->group_by('id');
        $this->db->having('sum(in_qty-out_qty) <= 0');
        $query = $this->db->get('farm_inventory');
        return $query->result_array();
        
    }
    
    function get_inventory_by_item_id($prod_product_id)
    {
        $query = $this->db->get_where('farm_inventory fi',array('fi.prod_product_id'=>$prod_product_id));
        
        if($query->num_rows() > 0)
        {
            return $query->result_array();
        }
    }
    
    function get_inventory_by_product_id($inventory_id)
    {
        
        $this->db->select('fi.id,prod_product_id,ibn,in_qty,in_date,fid.out_qty,(fi.in_qty-fi.out_qty) as balance,status,fid.out_date');
        $this->db->join('farm_inventory_detail fid','fid.inventory_id = fi.id','RIGHT');
        $query = $this->db->get_where('farm_inventory fi',array('fi.id'=>$inventory_id));
        return $query->result_array();
        
    }
    function get_inventoryName($inventory_id)
    {
       $query = $this->db->get_where('farm_inventory',array('id'=>$inventory_id));
      
       if($inventoryName = $query->row())
        {
            return $inventoryName->name;
        }
        return '';
    }
    
    function get_activeinventory($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('farm_inventory',array('status'=>'active'));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('farm_inventory',array('id'=>$id,'status'=>'active'));
       return $query->result_array();
    }
    
    function add_inventory()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                     );
                  
        $this->db->insert('farm_inventory',$data);
                       
    }
    
    function update_inventory()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      
                        
                      );
                  
        $this->db->update('farm_inventory',$data,array('id'=>$_POST['id'])); 
        
                 
    }
    function inactivate_inventory($id)
    {
        $query = $this->db->update('farm_inventory',array('status'=>'inactive'),array('id'=>$id));
        
       
    }
    
    
    function delete_inventory($id)
    {
        $query = $this->db->delete('farm_inventory',array('id'=>$id));
            
    }
    
    function delete_inventory_detail($id)
    {
        $query = $this->db->delete('farm_inventory_detail',array('inventory_id'=>$id));
            
    }
    
    function get_outqty_by_ibn($ibn_id)
    {
        // $this->db->select('out_qty');
        $this->db->where('id',$ibn_id);
        $query = $this->db->get('farm_inventory');
        
        //  return $query->result_array();
         
       if($rows = $query->row())
        {
            return $rows->out_qty;
        }
        return '';
    }
    
    
    function get_ibnDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('id,ibn');
        
        $query = $this->db->get_where('farm_inventory');
        
        if($query->num_rows() > 0)
        {
            foreach($query->result_array() as $row)
            {
                $data[$row['id']] = $row['ibn'];
            }
        }
        return $data;
    }
    
    function get_inventoryProductDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('prod_product_id,ibn');
        
        $query = $this->db->get_where('farm_inventory');
        
        if($query->num_rows() > 0)
        {
            foreach($query->result_array() as $row)
            {
                $data[$row['prod_product_id']] = $this->M_products->get_productName($row['prod_product_id']);
            }
        }
        return $data;
    }
    
    function get_inventoryDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('fi.id,pp.name');
        $this->db->join("prod_products pp",'pp.id=fi.prod_product_id','LEFT');
        
        $query = $this->db->get_where('farm_inventory fi');
        
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