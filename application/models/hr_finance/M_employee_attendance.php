<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
    class M_employee_attendance extends CI_Model {
        
        public function __construct()
        {
            $this->load->database();
        }
        
        public function get_emp_attendance_days($emp_id,$month, $from_date = null, $to_date=null)
        {
            if($from_date != null)
            {
                $this->db->where('date_created >=',$from_date);
            }
            
            if($to_date != null)
            {
                $this->db->where('date_created <=',$to_date);
            }
        
            // $this->db->select('dated');
            $this->db->from('hr_employees_attendance');
            //$this->db->group_by('dated');
            // $this->db->where(array('company_id'=>$_SESSION['company_id']));
            $this->db->like('dated',$month,"RIGHT");
            $this->db->where('emp_id',$emp_id);
            
            $query = $this->db->get();
            return $query->result_array();
        }
        
        public function get_employee_attendance($emp_id,$day)
        {
            $this->db->select('status');
            $this->db->from('hr_employees_attendance');
            //$this->db->group_by('dated');
            $this->db->where(array('emp_id'=>$emp_id,
            'dated'=>$day));
            
            $query = $this->db->get();
            if($data = $query->row())
            {
                return $data->status;
            }
            return 'n/a';
        }
        
        public function employee_attendance_exist($emp_id,$day)
        {
            $this->db->select('id');
            $this->db->from('hr_employees_attendance');
            //$this->db->group_by('dated');
            $this->db->where(array('emp_id'=>$emp_id,'dated'=>$day));
            
            $query = $this->db->get();
            if($query->num_rows() > 0)
            {
                return true;
            }
            return false;
        }
        
        public function get_teach_attendance_by_id($id)
        {
            $this->db->select('*');
            $this->db->from('hr_employees_attendance');
            $this->db->where('id', $id);
            // $this->db->where('company_id', $_SESSION['company_id']);
            
            $query = $this->db->get();
            return $query->result_array();
        }
        
        public function get_teach_attendance($emp_id=null, $search_string=null, $order=null, $order_type='Asc', $limit_start=null, $limit_end=null)
        {
            $this->db->select('hr_employees_attendance.id');
            $this->db->select('hr_employees_attendance.emp_id');
            $this->db->select('acd_employees.employee_name');
            $this->db->select('hr_employees_attendance.status');
            $this->db->select('hr_employees_attendance.dated');
            $this->db->select('hr_employees_attendance.time');
            $this->db->select('hr_employees_attendance.remarks');
            $this->db->from('hr_employees_attendance');
            
            // $this->db->where('hr_employees_attendance.company_id', $_SESSION['company_id']);
            
            if($emp_id != null && $emp_id != 0){
			$this->db->where('emp_id', $emp_id);
	       	}
	       	
		      $this->db->join('acd_employees', 'hr_employees_attendance.emp_id = acd_employees.id', 'left');

		      $this->db->group_by('hr_employees_attendance.id');

		      
            $query = $this->db->get();
            
            return $query->result_array();
            
        }
        
        public function count_teach_attendance($emp_id=null, $search_string=null, $order=null)
        {
            $this->db->select('*');
            $this->db->from('hr_employees_attendance');
            // $this->db->where('company_id', $_SESSION['company_id']);
            
            if($emp_id != null && $emp_id != 0){
			$this->db->where('emp_id', $emp_id);
		}
		if($search_string){
			$this->db->like('description', $search_string);
		}
		if($order){
			$this->db->order_by($order, 'Asc');
		}else{
		    $this->db->order_by('id', 'Asc');
		}
        
            $query = $this->db->get();
            return $query->num_rows();
            
        }
        
        public function store_employee_attendance($data)
        {
            $insert = $this->db->insert('hr_employees_attendance', $data);
            return $insert;
        }
        
        public function update_teach_attendance($id, $data)
        {
            $this->db->where('id', $id);
            $this->db->update('hr_employees_attendance', $data);
            $report = array();
            //$report['error'] = $this->db->_error_number();
            //$report['message'] = $this->db->_error_message();
            if($report !=0) {
                return true;
            }else {
                return false;
            }
        }
        
        
        function delete_teach_attendance($id)
        {
            $this->db->where('id', $id);
            $this->db->delete('hr_employees_attendance');
        }
        
        function delete_attendance_by_emp_id($emp_id,$date)
        {
            $this->db->where(array('emp_id'=>$emp_id,'dated'=>$date));
            
            $this->db->delete('hr_employees_attendance');
        }
    }
    
    
?>