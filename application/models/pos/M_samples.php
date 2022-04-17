<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_samples extends CI_Model{
     
    function __construct()
    { 
        parent::__construct();
        $this->load->database();
    }
    
    function get_sample($id = FALSE, $from_date = null, $to_date=null)
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
            $query = $this->db->get_where('pos_samples',array('company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_samples',array('id'=>$id,'company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function get_sampleName($sample_id)
    {
       $query = $this->db->get_where('pos_samples',array('id'=>$sample_id,'company_id'=> $_SESSION['company_id']));
      
       if($sampleName = $query->row())
        {
            return $sampleName->name;
        }
        return '';
    }
    
    function get_activesamples($id = FALSE)
    {
        if($id == FALSE)
        {
            $query = $this->db->get_where('pos_samples',array('status'=>'active','company_id'=> $_SESSION['company_id']));
            return $query->result_array();
        }
        
       $query = $this->db->get_where('pos_samples',array('id'=>$id,'status'=>'active','company_id'=> $_SESSION['company_id']));
       return $query->result_array();
    }
    
    function add_sample()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                     );
                  
        $this->db->insert('pos_samples',$data);
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"sample","added","POS");
            // end logging                    
    }
    
    function update_sample()
    {
        $data = array(  'name'=>$_POST['name'],
                        'status'=>$_POST['status'],
                      'company_id'=> $_SESSION['company_id']
                        
                      );
                  
        $this->db->update('pos_samples',$data,array('id'=>$_POST['id'])); 
        
        //for logging
            $msg = $this->input->post('name',true);
            $this->M_logs->add_log($msg,"sample","updated","POS");
            // end logging                     
    }
    
    function delete_sample($id)
    {
        //$query = $this->db->update('pos_samples',array('status'=>'inactive'),array('id'=>$id));
        $query = $this->db->delete('pos_samples',array('id'=>$id));
        //for logging
            $msg = $this->input->post('id',true);
            $this->M_logs->add_log($msg,"sample","inactivated","POS");
            // end logging    
    }
    
    function get_activesamplesDDL()
    {
        $data = array();
        $data[0] = "--Please Select--";
        $this->db->select('id,name');
        
        $query = $this->db->get_where('pos_samples',array('status'=>'active','company_id'=> $_SESSION['company_id']));
        
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