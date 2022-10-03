<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
class C_employees_attendance extends MY_Controller {
    
    public function __construct()
    {
        parent::__construct();
        $this->lang->load('message');
    }
    
    public function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'Employees Attendance Report';
        $data['main'] = 'Employees Attendance Report';
        
        $data['cur_month']=($this->input->post('cur_month') ? $this->input->post('cur_month') : date('Y-m'));
        
        $data['main_small'] = '<br />'.date('F Y',strtotime($data['cur_month']));
        
        $data['attendance_days'] =  $this->M_employee_attendance->get_emp_attendance_days($data['cur_month']);
        $data['employees'] = $this->M_employees->get_active_employeesBYHireDate($data['cur_month']);
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/employees/attendance/list',$data);
        $this->load->view('templates/footer');
    }
    
    public function saveTchAttendance()
    {
        //var_dump($_POST);
        $employees = $_POST['employee_id'];
        //extract JSON array items from posted data.
        if(count($_POST) > 0)
        {
            if($_POST['dated'])
            {
                $i = 0;
                foreach($employees as $values):
                    
                     $data = array(
                        'company_id'=> $_SESSION['company_id'],
                        //'class_id' => $_POST['std_class_id'][$i],
                        //'section_id' => $_POST['std_section_id'][$i],
                        'employee_id'=>$values,
                        'dated'=>$_POST['dated'],
                        'status' => $_POST['status'][$i],
                        'remarks'=>$_POST['remarks']
                        );
                        
                   $this->M_employee_attendance->store_teach_attendance($data);
                   
                   $i++; 
                endforeach;
                
                $this->session->set_flashdata('message','Saved successfully');
                redirect('hr_finance/C_employees_attendance','refresh');
            }else
            {
                $this->session->set_flashdata('error','Please select date');
                redirect('hr_finance/C_employees_attendance/add','refresh');
            }
            
        }
        else
        {
            echo 'No Data';
        }
    }
    public function update()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        //student attendance id
        $id = $this->uri->segment(5);
        
        //after save button click
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form validation
        $this->form_validation->set_rules('employee_id', 'employee_id', 'required');
        $this->form_validation->set_rules('stauts', 'status', 'required');
        $this->form_validation->set_rules('dated', 'dated', 'required');
        $this->form_validation->set_rules('time', 'time', 'required');
        $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
        
        //after form validation complete
        if($this->form_validation->run())
        {
             $data_to_store = array(
            'employee_id' => $this->input->post('employee_id'),
            'status' => $this->input->post('status'),
            'dated' => $this->input->post('dated'),
            'time' =>$this->input->post('time'),
            'remarks' => $this->input->post('remarks')
            );
            
            //show flash message after updation complete
            if($this->M_employee_attendance->update_teach_attendance($id, $data_to_store) == true) {
                $this->session->set_flashdata('flash_message', 'updated');
                                
            }else {
                $this->session->set_flashdata('flash_message', 'not_updated');
            }
            redirect('hr_finance/C_employees_attendance/update/'.$id.'');
            }
        }
        
        //student attendance data
        $data['employee_attendance'] = $this->M_employee_attendance->get_teach_attendance_by_id($id);
        //fetch employees data to populate the select field
        $data['employees'] = $this->M_employees->get_employees();
        
        $data['title'] = 'Employees Attendance';   
        $data['main'] = 'Employees Attendance';
    
        //load the view
        $data['main_content'] = 'hr_finance/employees/attendance/edit';
        $this->load->view('templates/template', $data);
    }
        
    public function delete()
    {
        //id
        $id = $this->uri->segment(5);
        $this->M_employee_attendance->delete_teach_attendance($id);
        redirect('hr_finance/C_employees_attendance');
    }
        
    public function add()
    {
            $data = array('langs' => $this->session->userdata('lang'));
            if($this->input->server('REQUEST_METHOD') === 'POST')
            {
                $employees = $this->input->post('employee_id');
                if($this->input->post('dated'))
                {
                    $i = 0;
                    foreach($employees as $values):
                        
                         $data = array(
                            'emp_id'=>$values,
                            'dated'=>$this->input->post('dated'),
                            'time_in' => $this->input->post('time_in')[$i],
                            'time_out' => $this->input->post('time_out')[$i],
                            'full_day' => $this->input->post('full_day')[$i],
                            'overtime' => $this->input->post('overtime')[$i],
                            'weekend' => $this->input->post('weekend')[$i],
                            'holiday' => $this->input->post('holiday')[$i],
                            'quarantine' => $this->input->post('quarantine')[$i],
                            'undertime' => $this->input->post('undertime')[$i],
                            'late' => $this->input->post('late')[$i],
                            'absent' => $this->input->post('absent')[$i],
                            'leave' => $this->input->post('leave')[$i],
                            'date_created' => date("Y-m-d H:i:s"),
                            
                            );
                            
                       $this->M_employee_attendance->store_employee_attendance($data);
                       
                       $i++; 
                    endforeach;
                    
                    $this->session->set_flashdata('message','Saved successfully');
                    redirect('hr_finance/C_employees_attendance','refresh');
                }else
                {
                    $this->session->set_flashdata('error','Please select date');
                    redirect('hr_finance/C_employees_attendance/add','refresh');
                }
            }
        
        //fetch employees data to populate the select field
        $data['employees'] = $this->M_employees->get_employees();
        
        $data['title'] = 'Employees Attendance';   
        $data['main'] = 'Employees Attendance';
        
        //load the view
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/employees/attendance/add',$data);
        $this->load->view('templates/footer');

        // $data['main_content'] = 'hr_finance/employees_attendance/add';
        // $this->load->view('templates/template', $data);
    }
    
    public function search()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $class_id = $this->input->post('class_id');
        $section_id = $this->input->post('section_id');
       
        //fetch employees data to populate the select field
        $data['employees'] = $this->M_employees->get_employees($class_id,$section_id);
        
        $data['title'] = 'Employees Attendance';   
        $data['main'] = 'Employees Attendance';
        
        //load the view
        $data['main_content'] = 'hr_finance/employees_attendance/add';
        $this->load->view('templates/template', $data);
    }
}
    
    
    
?>