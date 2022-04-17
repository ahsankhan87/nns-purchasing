<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_receivings extends CI_Model{
    
    public function __construct()
    {
        parent::__construct();
        
    }
    
    function get_receivings($receiving_id = FALSE, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('receiving_date >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('receiving_date <=',$to_date);
        }
        
        if($receiving_id == FALSE)
        {
            $query = $this->db->get_where('pos_receivings',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_receivings',array('receiving_id'=>$receiving_id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_selected_receivings($from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('receiving_date >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('receiving_date <=',$to_date);
        }
        
        $this->db->select('r.receiving_id,r.invoice_no,r.receiving_date,r.total_amount,r.total_tax,(total_amount+r.total_tax) AS net_amount,
        r.supplier_id,r.account,r.employee_id,r.shipping,r.delivery_status,r.payment_status,r.currency_id,c.code,c.symbol,s.name as supplier,
        r.msds,r.coa,r.flowchart,r.forme,r.halal,r.supplier_invoice_no,r.eta,r.etd,r.awb,r.quotation,r.delivery_date,r.fan,r.ssdt,r.supplier_pi,r.payment_date,r.quotation_file');
        $this->db->join('pos_supplier as s','s.id = r.supplier_id','left');
        //$this->db->join('pos_employees as e','e.id = r.employee_id','left');
        $this->db->join('pos_currencies as c','c.id = r.currency_id','left');
        
        $query = $this->db->get('pos_receivings as r');
        return $query->result_array();
        
    }
    
    function get_creditPurchases($supplier_id)
    {
       $this->db->where('total_amount > paid');
       $this->db->where('(total_amount-paid) >',0);
       
       $query = $this->db->get_where('pos_receivings',array('account'=>'credit','register_mode'=>'receive',
       'supplier_id'=>$supplier_id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function updatePaidAmount($invoice_no,$data)
    {
       
       $this->db->update('pos_receivings',$data,array('invoice_no'=>$invoice_no,'company_id'=> $_SESSION['company_id']));
       
    }
    
    function get_receiving_items_1($receiving_id,$invoice_no='false')//for receipt
    {
        if($receiving_id != 'false')
        {
            $this->db->where('A.receiving_id',$receiving_id);
        }
        
        if($invoice_no != 'false')
        {
            $this->db->like('A.invoice_no',$invoice_no);
        }
        
       $this->db->select('A.receiving_id,A.receiving_date,A.amount_due,A.description,A.register_mode,A.employee_id,A.supplier_id,
       A.currency_id,A.invoice_no,B.unit_id,B.item_id,B.item_cost_price,B.item_unit_price,B.size_id,B.quantity_purchased as qty,B.discount_percent,A.account,
       B.tax_rate,B.tax_id,A.shipping,A.delivery_status,A.payment_status,A.currency_id,A.fan,A.ssdt,A.supplier_pi,quotation_file,
       A.coa,A.msds,A.flowchart,A.forme,A.halal,A.quotation');
       $this->db->join('pos_receivings_items as B','A.receiving_id = B.receiving_id');
       $query = $this->db->get('pos_receivings as A');
       return $query->result_array();
       
    }
    
    function get_receiving_items($receiving_id)//for receipt
    {
       $this->db->select('B.receiving_id,B.tax_id,B.tax_rate,B.service,B.invoice_no,
       B.unit_id,B.item_id,B.item_cost_price,B.item_unit_price,B.size_id,B.quantity_purchased,B.discount_percent,
       B.tax_rate,B.tax_id');
       //$this->db->join('pos_receivings_items as B','A.receiving_id = B.receiving_id');
       $query = $this->db->get_where('pos_receivings_items as B',array('B.receiving_id'=>$receiving_id));
       return $query->result_array();
       
    }
    
    function getMAXPurchaseInvoiceNo()
    {   
        $this->db->order_by('receiving_id','desc');
        $this->db->where('company_id', $_SESSION['company_id']);
        $query = $this->db->get('pos_receivings',1);
        return $query->row()->invoice_no;
    }
    
    public function get_totalCostByReceivingID($invoice_no)
    {
       $data = 0;
       $this->db->select('SUM(item_cost_price*quantity_purchased) as price');   
       $query = $this->db->get_where('pos_receivings_items',array('invoice_no'=>$invoice_no));
       $rows = $query->row();
       
       if($rows)
       {
        return floatval($rows->price);
       }
    }
    
    public function get_totalCostByCategory()
    {
       $data = 0;
       $this->db->select('SUM(rt.item_cost_price*rt.quantity_purchased) as amount, r.currency_id,it.category_id');   
       $this->db->join('pos_receivings_items as rt','rt.item_id = it.item_id','left');
       $this->db->join('pos_receivings as r','r.receiving_id = rt.receiving_id','left');
       $this->db->group_by('it.category_id');
       $query = $this->db->get_where('pos_items it',array('r.company_id'=>$_SESSION['company_id']));
       
       if($query->num_rows() > 0)
       {
        return $query->result_array();
       }
       
       return array();
    }
    
    
    public function get_volume_of_items()
    {
       $data = 0;
       $this->db->select('rt.item_id, sum(rt.quantity_purchased) AS qty,rt.unit_id');   
       //$this->db->join('pos_receivings_items as rt','rt.item_id = it.item_id','left');
    //   $this->db->join('pos_receivings as r','r.receiving_id = rt.receiving_id','left');
       $this->db->group_by('rt.item_id');
       $this->db->order_by("MAX('rt.item_cost_price')",'desc');
       $query = $this->db->get('pos_receivings_items as rt');
       
       if($query->num_rows() > 0)
       {
        return $query->result_array();
       }
       
       return array();
    }
    
    function get_receiving_by_invoice($invoice_no)
    {   
        $this->db->where(array('invoice_no'=>$invoice_no,'company_id'=>$_SESSION['company_id']));
        $query = $this->db->get('pos_receivings');
        return $query->result_array();
       
    }
    
    function get_receivingsDDL()
    {
        $data = array();
        $data[''] = "--Please Select--";
        $this->db->select('receiving_id,invoice_no');
        
        $query = $this->db->get_where('pos_receivings',array('company_id'=> $_SESSION['company_id']));
        
        if($query->num_rows() > 0)
        {
            foreach($query->result_array() as $row)
            {
                $data[$row['receiving_id']] = $row['invoice_no'];
            }
        }
        return $data;
    }
    
    function get_receiving_supplier($receiving_id)
    {
        $data = array();
        $this->db->select('receiving_id,invoice_no,supplier_id');
        
        $query = $this->db->get_where('pos_receivings',array('receiving_id'=>$receiving_id,'company_id'=> $_SESSION['company_id']));
        
        if($query->num_rows() > 0)
        {
            return $query->result_array();
        }
        return $data;
    }
    
    function delete($invoice_no)
    {
        $this->db->delete('pos_receivings',array('invoice_no'=>$invoice_no));
        
        $this->db->delete('pos_receivings_items',array('invoice_no'=>$invoice_no));
        
        $this->db->delete('acc_entries',array('invoice_no'=>$invoice_no));
        $this->db->delete('acc_entry_items',array('invoice_no'=>$invoice_no));
        
        $this->db->delete('pos_supplier_payments',array('invoice_no'=>$invoice_no));
        
        //for logging
        $msg = $invoice_no;
        $this->M_logs->add_log($msg,"Receivings","Deleted","POS");
        // end logging
    }
    
    function delete_by_id($receiving_id)
    {
        $this->db->delete('pos_receivings',array('receiving_id'=>$receiving_id));
        
        $this->db->delete('pos_receivings_items',array('receiving_id'=>$receiving_id));
        
        // $this->db->delete('acc_entries',array('invoice_no'=>$invoice_no));
        // $this->db->delete('acc_entry_items',array('invoice_no'=>$invoice_no));
        
        // $this->db->delete('pos_supplier_payments',array('invoice_no'=>$invoice_no));
        
        //for logging
        $msg = 'receiving_id '.$receiving_id;
        $this->M_logs->add_log($msg,"Receivings","Deleted","POS");
        // end logging
    }
}
    