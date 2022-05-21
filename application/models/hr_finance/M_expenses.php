<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class m_expenses extends CI_Model{
    
    public function __construct()
    {
        parent::__construct();
        
    }
    
    function get_expenses($expenses_id = FALSE, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('expense_date >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('expense_date <=',$to_date);
        }
        
        if($expenses_id == FALSE)
        {
            $query = $this->db->get_where('finance_expenses');
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_expenses',array('id'=>$expenses_id));
       return $query->result_array();
    }
    
    function get_selected_expenses($from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('expense_date >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('expense_date <=',$to_date);
        }
        
        $this->db->select('s.expense_id,s.invoice_no,s.expense_date,s.expense_time,(s.total_amount+s.total_tax) AS net_amount,
        s.customer_id,s.account,s.employee_id,e.first_name as emp,c.store_name as customer');
        $this->db->join('pos_customers as c','c.id = s.customer_id','left');
        $this->db->join('pos_employees as e','e.id = s.employee_id','left');
        
        $query = $this->db->get_where('finance_expenses as s',array('s.company_id'=> $_SESSION['company_id']));
        return $query->result_array();
        
    }
    
    function get_creditexpenses($customer_id)
    {
       $this->db->where('total_amount > paid');
       $this->db->where('(total_amount-paid) >',0);
       
       $query = $this->db->get_where('finance_expenses',array('account'=>'credit','register_mode'=>'expense',
       'customer_id'=>$customer_id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function updatePaidAmount($invoice_no,$data)
    {
       
       $this->db->update('finance_expenses',$data,array('invoice_no'=>$invoice_no,'company_id'=> $_SESSION['company_id']));
       
    }
    
    function get_expenses_items($new_invoice_no)//for receipt
    {
       $this->db->select('A.expense_date,A.expense_time,A.amount_due,A.register_mode,A.employee_id,A.discount_value as total_discount,A.customer_id,
       A.currency_id,A.description,A.invoice_no,A.account,A.is_taxable,
       B.unit_id,B.item_id,B.item_unit_price,B.item_cost_price,B.quantity_sold,
       B.discount_percent,B.discount_value,B.tax_rate,B.tax_id,B.inventory_acc_code');
       $this->db->join('finance_expenses_items as B','A.expense_id = B.expense_id');
       $query = $this->db->get_where('finance_expenses as A',array('A.invoice_no'=>$new_invoice_no,'A.company_id'=> $_SESSION['company_id']));
       return $query->result_array();
       
    }
    
    function get_expenses_by_payment_for($payment_for)
    {   
        $this->db->where(array('payment_for_id'=>$payment_for));
        $query = $this->db->get('finance_expenses');
        return $query->result_array();
       
    }
    
    function get_expenses_items_only($expenses_id)//for receipt
    {
       $this->db->where(array('expense_id'=>$expenses_id));
       $query = $this->db->get('finance_expenses_items');
       return $query->result_array();
       
    }
    function getMAXexpenseInvoiceNo()
    {   
        $this->db->order_by('CAST(SUBSTR(invoice_no,2) AS UNSIGNED) DESC');
        $this->db->select('SUBSTR(invoice_no,2) as invoice_no');
        $this->db->where('company_id', $_SESSION['company_id']);
        $query = $this->db->get('finance_expenses',1);
        return $query->row()->invoice_no;
    }
    
    public function get_totalCostByexpenseID($invoice_no)
    {
       $this->db->select('SUM(item_unit_price*quantity_sold) as price, SUM(discount_value) as discount_value');   
       $query = $this->db->get_where('finance_expenses_items',array('invoice_no'=>$invoice_no));
       $rows = $query->row();
       if($rows)
       {
        return floatval($rows->price-$rows->discount_value);
       }
       
    }
    
    function delete($invoice_no)
    {
        $this->db->delete('finance_expenses',array('id'=>$invoice_no));
        
        $this->db->delete('finance_expenses_items',array('id'=>$invoice_no));
       
    }

    public function get_totalexpensesByCategory()
    {
        $data = 0;
        $this->db->select('SUM(rt.item_cost_price*rt.quantity_sold) as amount, r.currency_id,it.category_id');   
        $this->db->join('finance_expenses_items as rt','rt.item_id = it.item_id','left');
        $this->db->join('finance_expenses as r','r.expense_id = rt.expense_id','left');
        $this->db->group_by('it.category_id');
        $query = $this->db->get_where('pos_items it',array('r.company_id'=>$_SESSION['company_id']));
        
        if($query->num_rows() > 0)
        {
            return $query->result_array();
        }
        
        return array();
    }

}
    