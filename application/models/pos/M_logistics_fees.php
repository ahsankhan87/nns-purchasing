<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_logistics_fees extends CI_Model{
    
    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    
    function get_logistics_fee($id = FALSE, $from_date = null, $to_date=null)
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
            $query = $this->db->get_where('pos_logistics_fees',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_logistics_fees',array('id'=>$id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_logistics_report($from_date=null,$to_date=null,$status)
    {
        if($status != 'All')
       {
            $this->db->where('payment_status',$status); 
       } 
       
       if($from_date != null && $to_date != null){
            $this->db->where("payment_date BETWEEN '$from_date' AND '$to_date'");
        }
        
       $query = $this->db->get('pos_logistics_fees');
       return $query->result_array();
    }
    
    function get_logistics_feeName($logistics_fee_id)
    {
       $query = $this->db->get_where('pos_logistics_fees',array('id'=>$logistics_fee_id,'company_id'=> $_SESSION['company_id']));
      
       if($logistics_feeName = $query->row())
        {
            return $logistics_feeName->name;
        }
        return '';
    }
    
    function get_activelogistics_fees($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('pos_logistics_fees',array('status'=>'active','company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_logistics_fees',array('id'=>$id,'status'=>'active','company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function add_logistics_fee()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('pos_logistics_fees',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"logistics_fee","added","POS");
            // end logging                    
    }
    
    function update_logistics_fee()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('pos_logistics_fees',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"logistics_fee","updated","POS");
            // end logging                     
    }
    
    function delete_logistics_fee($id)
    {
        //$query = $this->db->update('pos_logistics_fees',array('status'=>'inactive'),array('id'=>$id));
        $query = $this->db->delete('pos_logistics_fees',array('id'=>$id));
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"logistics_fee","inactivated","POS");
            // end logging    
    }
    
    function get_activelogistics_feesDDL()
    {
        $data = array();
        $data[0] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('pos_logistics_fees',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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