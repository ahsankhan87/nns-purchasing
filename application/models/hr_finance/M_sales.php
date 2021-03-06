<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class m_sales extends CI_Model{
    
    public function __construct()
    {
        parent::__construct();
        
    }
    
    function get_sales($sales_id = FALSE, $from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('sale_date >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('sale_date <=',$to_date);
        }
        
        if($sales_id == FALSE)
        {
            $query = $this->db->get_where('finance_sales',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('finance_sales',array('sale_id'=>$sales_id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_selected_sales($from_date = null, $to_date=null)
    {
        if($from_date != null)
        {
            $this->db->where('sale_date >=',$from_date);
        }
        
        if($to_date != null)
        {
            $this->db->where('sale_date <=',$to_date);
        }
        
        $this->db->select('s.sale_id,s.invoice_no,s.sale_date,s.sale_time,(s.total_amount+s.total_tax) AS net_amount,
        s.customer_id,s.account,s.employee_id,e.first_name as emp,c.store_name as customer');
        $this->db->join('pos_customers as c','c.id = s.customer_id','left');
        $this->db->join('pos_employees as e','e.id = s.employee_id','left');
        
        $query = $this->db->get_where('finance_sales as s',array('s.company_id'=> $_SESSION['company_id']));
        return $query->result_array();
        
    }
    
    function get_creditSales($customer_id)
    {
       $this->db->where('total_amount > paid');
       $this->db->where('(total_amount-paid) >',0);
       
       $query = $this->db->get_where('finance_sales',array('account'=>'credit','register_mode'=>'sale',
       'customer_id'=>$customer_id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function updatePaidAmount($invoice_no,$data)
    {
       
       $this->db->update('finance_sales',$data,array('invoice_no'=>$invoice_no,'company_id'=> $_SESSION['company_id']));
       
    }
    
    function get_sales_items($new_invoice_no)//for receipt
    {
       $this->db->select('A.sale_date,A.sale_time,A.amount_due,A.register_mode,A.employee_id,A.discount_value as total_discount,A.customer_id,
       A.currency_id,A.description,A.invoice_no,A.account,A.is_taxable,
       B.unit_id,B.item_id,B.item_unit_price,B.item_cost_price,B.quantity_sold,
       B.discount_percent,B.discount_value,B.tax_rate,B.tax_id,B.inventory_acc_code');
       $this->db->join('finance_sales_items as B','A.sale_id = B.sale_id');
       $query = $this->db->get_where('finance_sales as A',array('A.invoice_no'=>$new_invoice_no,'A.company_id'=> $_SESSION['company_id']));
       return $query->result_array();
       
    }
    
    function get_sales_by_invoice($invoice_no)
    {   
        $this->db->where(array('invoice_no'=>$invoice_no));
        $query = $this->db->get('finance_sales');
        return $query->result_array();
       
    }
    
    function get_sales_items_only($invoice_no)//for receipt
    {
    //    $this->db->select('A.sale_date,A.sale_time,A.amount_due,A.register_mode,A.employee_id,A.discount_value as total_discount,A.customer_id,
    //    A.currency_id,A.description,A.invoice_no,A.account,A.is_taxable,
    //    B.unit_id,B.item_id,B.size_id,B.item_unit_price,B.item_cost_price,B.quantity_sold,B.exchange_rate,B.service,
    //    B.discount_percent,B.discount_value,B.tax_rate,B.tax_id,B.inventory_acc_code');
    //    $this->db->join('finance_sales_items as B','A.sale_id = B.sale_id');
       
       $this->db->where(array('invoice_no'=>$invoice_no));
       $query = $this->db->get('finance_sales_items');
       return $query->result_array();
       
    }

    function get_sales_charges_by_invoice($invoice_no)
    {   
        $this->db->where(array('invoice_no'=>$invoice_no));
        $query = $this->db->get('finance_sales_charges');
        return $query->result_array();
       
    }
    
    function get_sales_deduction_by_invoice($invoice_no)
    {   
        $this->db->where(array('invoice_no'=>$invoice_no));
        $query = $this->db->get('finance_sales_deduction');
        return $query->result_array();
       
    }
    
    function get_sales_payment_summary_by_invoice($invoice_no)
    {   
        $this->db->where(array('invoice_no'=>$invoice_no));
        $query = $this->db->get('finance_payment_summary');
        return $query->result_array();
       
    }
    
    function getMAXSaleInvoiceNo()
    {   
        $this->db->order_by('CAST(SUBSTR(invoice_no,2) AS UNSIGNED) DESC');
        $this->db->select('SUBSTR(invoice_no,2) as invoice_no');
        //$this->db->where('company_id', $_SESSION['company_id']);
        $query = $this->db->get('finance_sales',1);
        return $query->row()->invoice_no;
    }
    
    function check_invoiceno_exist($invoice_no)
    {   
        $this->db->where('invoice_no',$invoice_no);
        $query = $this->db->get('finance_sales');
        
        if($query->num_rows() > 0)
        {
            return true;
        }
        return false;
    }
    
    function get_last_payment_date_by_invoice($invoice_no)
    {   
        $this->db->where(array('invoice_no'=>$invoice_no));
        $this->db->order_by("id",'desc');
        $query = $this->db->get('finance_payment_summary');
        $rows = $query->row();
        if($rows)
        {
            return $rows->payment_date;
        }else return "";
       
    }
    
    public function get_totalCostBysaleID($invoice_no)
    {
       $this->db->select('SUM(item_unit_price*quantity_sold) as price, SUM(discount_value) as discount_value');   
       $query = $this->db->get_where('finance_sales_items',array('invoice_no'=>$invoice_no));
       $rows = $query->row();
       if($rows)
       {
        return floatval($rows->price-$rows->discount_value);
       }
       
    }
    
    function delete($invoice_no)
    {
        $this->db->delete('finance_sales',array('invoice_no'=>$invoice_no));
        
        $this->db->delete('finance_sales_items',array('invoice_no'=>$invoice_no));
        
        $this->db->delete('finance_sales_charges',array('invoice_no'=>$invoice_no));
        $this->db->delete('finance_sales_deduction',array('invoice_no'=>$invoice_no));
        
        $this->db->delete('prod_customer_payments',array('invoice_no'=>$invoice_no));

        $this->load->helper("url");
        $payment_summary = $this->get_sales_payment_summary_by_invoice($invoice_no);
        
        if (isset($_FILES['payment_file']) && $_FILES['payment_file']['error'] == 0) 
        {
            foreach($payment_summary as $values)
            {
                if($values['payment_method_file'] != '')
                {   
                    //DELETE THE PREVIOUSE PICTURE
                    $file = FCPATH.'images/sales/'.$values['payment_method_file'];
                    @unlink($file);
                    /////////////
                } 
            }
        }
        $this->db->delete('finance_payment_summary',array('invoice_no'=>$invoice_no));

    }

    public function get_totalSalesByCategory()
    {
        $data = 0;
        $this->db->select('SUM(rt.item_cost_price*rt.quantity_sold) as amount, r.currency_id,it.category_id');   
        $this->db->join('finance_sales_items as rt','rt.item_id = it.item_id','left');
        $this->db->join('finance_sales as r','r.sale_id = rt.sale_id','left');
        $this->db->group_by('it.category_id');
        $query = $this->db->get_where('pos_items it',array('r.company_id'=>$_SESSION['company_id']));
        
        if($query->num_rows() > 0)
        {
            return $query->result_array();
        }
        
        return array();
    }

}
    