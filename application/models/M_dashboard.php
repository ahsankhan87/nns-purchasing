<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_dashboard extends CI_Model{
    
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    
    function PurchaseReport($company_id,$limit=5, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('receiving_date >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('receiving_date <=',$to_date);
        }
        
        $this->db->select('invoice_no,receiving_date,sup.name as supplier');
        $this->db->join('pos_supplier sup','sup.id=pos_receivings.supplier_id','left');
        //$this->db->join('acc_entries e','e.id=ei.entry_id');        
        $options = array('pos_receivings.company_id'=> $company_id);
        $this->db->where('payment_status','Unpaid');
        
        $query = $this->db->get_where('pos_receivings',$options,$limit);
        //$ledgers = $query->result_array();
        
        if($query->num_rows() > 0)
        {
          return $query->result_array();
            
        }
        
        return array();
    
    }
     
    function PurchaseItemsReport($company_id,$limit=5, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('receiving_date >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('receiving_date <=',$to_date);
        }
        
        $this->db->select('rt.invoice_no,,rt.quantity_purchased as qty,receiving_date,etd,eta,awb,rt.item_id');
        $this->db->join('pos_receivings_items rt','rt.receiving_id=pos_receivings.receiving_id','left');
        //$this->db->join('acc_entries e','e.id=ei.entry_id');        
        $options = array('pos_receivings.company_id'=> $company_id);
        $this->db->where('delivery_status','Pending');
        
        $query = $this->db->get_where('pos_receivings',$options,$limit);
        //$ledgers = $query->result_array();
        
        if($query->num_rows() > 0)
        {
          return $query->result_array();
            
        }
        
        return array();
    
    }
    
    function claimsReport($company_id,$limit=5, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('date_created >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('date_created <=',$to_date);
        }
        
        $options = array('cl.company_id'=> $company_id);
        $this->db->where('status','Pending');
        
        $query = $this->db->get_where('pos_claims cl',$options,$limit);
        //$ledgers = $query->result_array();
        
        if($query->num_rows() > 0)
        {
          return $query->result_array();
            
        }
        
        return array();
    
    }
    
    function logisticsReport($company_id,$limit=5, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('date_created >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('date_created <=',$to_date);
        }
        
        $options = array('company_id'=> $company_id);
        $this->db->where('payment_status','Unpaid');
        
        $query = $this->db->get_where('pos_logistics_fees',$options,$limit);
        //$ledgers = $query->result_array();
        
       if($query->num_rows() > 0)
        {
          return $query->result_array();
            
        }
        
        return array();
    
    }
    
    function sourcingReport($company_id,$limit=5, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('date_created >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('date_created <=',$to_date);
        }
        
        $options = array('company_id'=> $company_id);
        $this->db->where('status','On Process');
        
        $query = $this->db->get_where('pos_sourcings',$options,$limit);
        //$ledgers = $query->result_array();
        
       if($query->num_rows() > 0)
        {
          return $query->result_array();
            
        }
        
        return array();
    
    }
    
    
    function sampleReport($company_id,$limit=5, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('date_created >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('date_created <=',$to_date);
        }
        
        $options = array('company_id'=> $company_id);
        $this->db->where('delivery_status','Pending');
        
        $query = $this->db->get_where('pos_samples',$options,$limit);
        //$ledgers = $query->result_array();
        
       if($query->num_rows() > 0)
        {
          return $query->result_array();
            
        }
        
        return array();
    
    }
    
    function purchaseRequestReport($limit=5, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('date_created >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('date_created <=',$to_date);
        }
        
        $this->db->where('status','On Process');
        $this->db->or_where('status','On Hold');
        
        $query = $this->db->get('pos_purchase_requests',$limit);
        //$ledgers = $query->result_array();
        
       if($query->num_rows() > 0)
        {
          return $query->result_array();
            
        }
        
        return array();
    
    }
    
    function monthlyPurchaseReport($company_id,$limit=5, $from_date = null, $to_date=null)
    {
        $this->db->select('date_format(receiving_date,"%Y-%m") as month,sum(total_amount)as amount');
        //$this->db->join('acc_entry_items ei','ei.account_code=g.account_code');
        //$this->db->join('acc_entries e','e.id=ei.entry_id');        
        $options = array('company_id'=> $company_id);
        $this->db->group_by('date_format(receiving_date,"%Y-%m")');
        $this->db->order_by('month','desc');
        $this->db->where('receiving_date >=', $from_date);
        $this->db->where('receiving_date <=', $to_date);
        
        $query = $this->db->get_where('pos_receivings',$options,$limit);
        $ledgers = $query->result_array();
        
        return  $ledgers;
    
    }
    
    function PurchaseByCurrency($company_id,$limit=5, $from_date = null, $to_date=null)
    {
        $this->db->select('cur.code as currency,sum(r.total_amount) as amount');
        $this->db->join('pos_currencies cur','cur.id=r.currency_id','left');
        //$this->db->join('acc_entries e','e.id=ei.entry_id');        
        $options = array('r.company_id'=> $company_id);
        $this->db->group_by('r.currency_id');
        // $this->db->order_by('month','desc');
        $this->db->where('r.receiving_date >=', $from_date);
        $this->db->where('r.receiving_date <=', $to_date);
        
        $query = $this->db->get_where('pos_receivings r',$options,$limit);
        $ledgers = $query->result_array();
        
        return  $ledgers;
    
    }
   
}