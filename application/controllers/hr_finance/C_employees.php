<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_employees extends MY_Controller{
    
    function __construct()
    {
        parent::__construct();
       $this->lang->load('index');
    } 
    
    function index($status = '')
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'Employee (Dashboard)';
        $data['main'] = 'Employee (Dashboard)';
        
        $data['employees']= $this->M_employees->get_employees(FALSE,$status);
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/employees/v_employees',$data);
        $this->load->view('templates/footer');
    }
    
    function empDetail($emp_id)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        $data['title'] = 'Employee Detail';
        $data['main'] = 'Employee Detail';
        
        $data['emp_detail']= $this->M_employees->get_employees($emp_id);
        
        $this->load->view('templates/header',$data);
        $this->load->view('hr_finance/employees/v_detail',$data);
        $this->load->view('templates/footer');
    }
    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            // var_dump($_POST);
            //form Validation
            $this->form_validation->set_rules('first_name', 'First Name', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                    $config['upload_path']          = './images/employees/';
                    $config['allowed_types']        = 'gif|jpg|png|jpeg';
                    $config['max_width']  = '1024';
                    $config['max_height']  = '768';
                    $config['overwrite'] = TRUE;
                    $config['encrypt_name'] = FALSE;
                    $config['remove_spaces'] = TRUE;
                    $config['file_name'] = time();
                    $this->load->library('upload', $config);
                    $this->upload->initialize($config);

                    //if not uploaded then display error
                    if(!$this->upload->do_upload('picture'))
                    {
                        $data['errors'] = $this->upload->display_errors();
                        $this->session->set_flashdata('error',$data['errors']);
                        // redirect('hr_finance/C_employees/create','refresh');
                        $this->load->view('hr_finance/employees/create',$data);
                    }else {
                        $this->upload->do_upload('picture');
                        $uploaddata = $this->upload->data();
                        $filename = $uploaddata['file_name'];
                    
                    }

                $data = array(
                'first_name' => $this->input->post('first_name', true),
                'last_name' => $this->input->post('last_name', true),
                'middle_name' => $this->input->post('middle_name', true),
                'suffix' => $this->input->post('suffix', true),
                'nick_name' => $this->input->post('nick_name', true),
                'picture' => @$filename,
                // 'city' => $this->input->post('city', true),
                // 'country' => $this->input->post('country', true),
                'email' => $this->input->post('email', true),
                'address' => $this->input->post('address', true),
                'contact' => $this->input->post('contact', true),
                'dob' => $this->input->post('dob', true),
                'hire_date' => $this->input->post('hire_date', true),
                //'cnic' => $this->input->post('cnic', true),
                'status' => $this->input->post('status', true),
                'marital_status' => $this->input->post('marital_status', true),
                'emp_no' => $this->input->post('emp_no', true),
                'position' => $this->input->post('position', true),
                'phic' => $this->input->post('phil_health', true),
                'pag_ibig' => $this->input->post('pag_ibig', true),
                'sss' => $this->input->post('sss', true),
                
                );
                //$this->db->insert(' hr_employees', $data);
            
                if($this->db->insert('hr_employees', $data)){
                    
                    //for logging
                    $msg = $this->input->post('first_name'). ' '. $this->input->post('last_name');
                    $this->M_logs->add_log($msg,"Employee","Added","POS");
                    // end logging
                    
                    $this->session->set_flashdata('message','Employee Created');
                }else{
                    $this->session->set_flashdata('error','Employee Not Created');
                }
                 //$this->M_employees->addEmployee();
            
            redirect('hr_finance/C_employees','refresh');
            //////////////////////////////////
            //upload images of the employee..
            //$config['upload_path'] = './images/employees';
//            $config['allowed_types'] = 'gif|jpg|png|jpeg';
//            $config['max_size']	= '2000';
//            $config['max_width'] = '2048';
//            $config['max_height'] = '1024';
//            $config['file_name'] = 'img'. time();
//            
//            $this->upload->initialize($config);
//            
//            //if not uploaded then display error
//            if(!$this->upload->do_upload('employee_image'))
//            {
//               
//                $data['errors'] = $this->upload->display_errors();
//                $this->session->set_flashdata('message',$data['errors']);
//                redirect('hr_finance/C_employees/create','refresh');
//            }
//            else
//            {
//                $data['upload_data'] = $this->upload->data();
//                $file_name = $this->upload->data();
//                
//              //creating thumbnail image of the uploaded image.
//                        $config['image_library'] = 'gd2';
//                        $config['source_image']	= './images/employee-images/'.$file_name['file_name'];
//                        $config['new_image'] = './images/employee-images/thumbs';
//                        //$config['create_thumb'] = TRUE;
//                        $config['maintain_ratio'] = false;
//                        $config['width']	= 300;
//                        $config['height']	= 200;
//                        
//                        //$this->load->library('image_lib', $config); 
//                        $this->image_lib->initialize($config); 
//                        $this->image_lib->resize();
            ////////////////////////////////////
            
            }
        }
        //else
        //{
            $data['title'] = 'Add New Employee';
            $data['main'] = 'Add New Employee';
            
            //$data['areaDDL'] = $this->M_areas->get_activeareasDDL();
            
               
            $this->load->view('templates/header',$data);
            $this->load->view('hr_finance/employees/create',$data);
            $this->load->view('templates/footer');
        //}
    }
    //edit category
    public function edit($id=NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('first_name', 'First Name', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                if($_FILES['picture']['size'] != 0)
                {
                    $config['upload_path'] = './images/employees/';
                    $config['allowed_types'] = 'gif|jpg|png|jpeg';
                    $config['max_width']  = '1024';
                    $config['max_height']  = '768';
                    $config['overwrite'] = TRUE;
                    $config['encrypt_name'] = FALSE;
                    $config['remove_spaces'] = TRUE;
                    $config['file_name'] = time();
                    $this->load->library('upload', $config);
                    $this->upload->initialize($config);

                    //if not uploaded then display error
                    if(!$this->upload->do_upload('picture'))
                    {
                        $data['errors'] = $this->upload->display_errors();
                        $this->session->set_flashdata('message',$data['errors']);
                        redirect('hr_finance/C_employees/edit/'.$this->input->post('id'),'refresh');
                        // $this->load->view('hr_finance/employees/edit',$data);
                    }else {
                        $this->upload->do_upload('picture');
                        $uploaddata = $this->upload->data();
                        $filename = $uploaddata['file_name'];
                    
                    }
                    
                }else {
                    $filename = $this->input->post('picture_old');
                }
            
                $data = array(
                    'first_name' => $this->input->post('first_name', true),
                    'last_name' => $this->input->post('last_name', true),
                    'middle_name' => $this->input->post('middle_name', true),
                    'suffix' => $this->input->post('suffix', true),
                    'nick_name' => $this->input->post('nick_name', true),
                    'picture' => @$filename,
                    // 'city' => $this->input->post('city', true),
                    // 'country' => $this->input->post('country', true),
                    'email' => $this->input->post('email', true),
                    'address' => $this->input->post('address', true),
                    'contact' => $this->input->post('contact', true),
                    'dob' => $this->input->post('dob', true),
                    'hire_date' => $this->input->post('hire_date', true),
                    //'cnic' => $this->input->post('cnic', true),
                    'status' => $this->input->post('status', true),
                    'marital_status' => $this->input->post('marital_status', true),
                    'emp_no' => $this->input->post('emp_no', true),
                    'position' => $this->input->post('position', true),
                    'phic' => $this->input->post('phil_health', true),
                    'pag_ibig' => $this->input->post('pag_ibig', true),
                    'sss' => $this->input->post('sss', true),
                    
                );
                //$this->db->update(' hr_employees', $data, array('id'=>$_POST['id']));
            
                    //DELETE OLD PICTURE FROM DRIVE
                    if($_FILES['picture']['size'] != 0)
                    {   //DELETE THE PREVIOUSE PICTURE
                        $old_picture = $uploaddata['file_path'].$this->input->post('picture_old');
                        @unlink($old_picture);
                        /////////////
                    }

                if($this->db->update('hr_employees', $data, array('id'=>$this->input->post('id',true)))){
                    
                     //for logging
                    $msg = $this->input->post('first_name'). ' '. $this->input->post('last_name');
                    $this->M_logs->add_log($msg,"Employee","Updated","POS");
                    // end logging
                    
                    $this->session->set_flashdata('message','Employee Updated');
                }else{
                    $this->session->set_flashdata('message','Employee Not Updated');
                }
            //////////////////////////////////
            //upload images of the employee..
            //$config['upload_path'] = './images/employee-images';
//            $config['allowed_types'] = 'gif|jpg|png|jpeg';
//            $config['max_size']	= '2000';
//            $config['max_width'] = '2048';
//            $config['max_height'] = '1024';
//            $config['file_name'] = 'img'. time();
//            
//            $this->upload->initialize($config);
//            
//            //if not uploaded then display error
//            if(!$this->upload->do_upload('employee_image'))
//            {
//               
//                $data['errors'] = $this->upload->display_errors();
//                $this->session->set_flashdata('message',$data['errors']);
//                redirect('hr_finance/employees/edit','refresh');
//            }
//            else
//            {
//                $data['upload_data'] = $this->upload->data();
//                $file_name = $this->upload->data();
//                
//              //creating thumbnail image of the uploaded image.
//                        $config['image_library'] = 'gd2';
//                        $config['source_image']	= './images/employee-images/'.$file_name['file_name'];
//                        $config['new_image'] = './images/employee-images/thumbs/';
//                        //$config['create_thumb'] = TRUE;
//                        $config['maintain_ratio'] = false;
//                        $config['width']	= 280;
//                        $config['height']	= 200;
//                        
//                        //$this->load->library('image_lib', $config); 
//                        $this->image_lib->initialize($config); 
//                        $this->image_lib->resize();
            ////////////////////////////////////
            
            
            //$this->M_employees->updateEmployee();
            //$this->session->set_flashdata('message','Employee Updated');
            redirect('hr_finance/C_employees','refresh');
            }
        }
        //else
        //{
            $data['title'] = 'Update Employee';
            $data['main'] = 'Update Employee';
            
            //$data['areaDDL'] = $this->M_areas->get_activeareasDDL();
            $data['employee'] = $this->M_employees->get_employees($id);
            
            $this->load->view('templates/header',$data);
            $this->load->view('hr_finance/employees/edit_1',$data);
            $this->load->view('templates/footer');
        //}
    }
    
    function create_emp_document()
    {
        // var_dump($_POST);
        // die;
        if ($_FILES['picture']['size'] != 0){

            $config['upload_path']          = './images/employees/documents/';
            $config['allowed_types']        = 'gif|jpg|png|jpeg|pdf';
            $config['max_width']  = '2048';
            $config['max_height']  = '1024';
            $config['overwrite'] = TRUE;
            $config['encrypt_name'] = FALSE;
            $config['remove_spaces'] = TRUE;
            $config['file_name'] = time();
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            $this->upload->do_upload('picture');
            $uploaddata = $this->upload->data();
            $filename = $uploaddata['file_name'];
        }else {
            $file_name = '';
        }
        // var_dump($uploaddata);
           
        $data = array(
            'emp_id'  => $this->input->post('employee_id'),
            'document_name'  => $this->input->post('document_name'),
            'reference_no'  => $this->input->post('reference_no'),
            'expiration'  => $this->input->post('expiration'),
            'picture' => @$filename,
            'date_created'=>date("Y-m-d H:i:s"),
           );
        
          echo $this->db->insert('hr_employees_documents',$data);
    }
    
    public function get_employees_documents($emp_id)
	{
	    
        echo json_encode($this->M_employees->get_employees_documents($emp_id));
        
    }
    
    function delete_emp_document($doc_id,$picture)
    {
        //DELETE THE PREVIOUS PICTURE
        unlink(FCPATH.'images/employees/documents/'.$picture);
        if($this->M_employees->delete_emp_document($doc_id))
        {
            echo true;
        }else {
            echo false;
        }
        /////////////

    }
    
    function delete($id)
    {
        $this->M_employees->deleteEmployee($id);   
        $this->session->set_flashdata('message','Employee Deleted');
        redirect('hr_finance/C_employees/index','refresh');
    }
    
    function inactivate($id) // it will inactive the page
    {
        $this->M_employees->inactivate($id);
        $this->session->set_flashdata('message','Employee Deleted');
                 
        redirect('hr_finance/C_employees/index','refresh');
    }
    
    function activate($id) // it will active 
    {
        $this->M_employees->activate($id);
        $this->session->set_flashdata('message','Employee Activated');
        
                    //for logging
                    $msg = 'Emp id '.$id;
                    $this->M_logs->add_log($msg,"Employee","activated","POS");
                    // end logging
                    
        redirect('hr_finance/C_employees/index','refresh');
    }
    
    
}