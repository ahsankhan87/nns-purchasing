<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class C_dispatch extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->lang->load('index');
    }

    function index()
    {
        $data = array('langs' => $this->session->userdata('lang'));

        $start_date = FY_START_DATE; //date("Y-m-d", strtotime("last year"));
        $to_date = FY_END_DATE; //date("Y-m-d");
        $fiscal_dates = "(From: " . date('d-m-Y', strtotime($start_date)) . " To:" . date('d-m-Y', strtotime($to_date)) . ")";

        $data['title'] = 'List of Dispatch';
        $data['main'] = 'List of Dispatch';

        $data['dispatch'] = $this->M_dispatch->get_dispatch(FALSE, $start_date, $to_date);

        $this->load->view('templates/header', $data);
        $this->load->view('production/dispatch/v_dispatch', $data);
        $this->load->view('templates/footer');
    }

    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));

        if ($this->input->server('REQUEST_METHOD') === 'POST') {

            //form Validation
            $this->form_validation->set_rules('dispatch_date', 'Date Issued', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');

            //after form Validation run
            if ($this->form_validation->run()) {
                $data = array(
                    'dispatch_date' => $this->input->post('dispatch_date'),
                    'product_id' => $this->input->post('product_id'),
                    'content' => $this->input->post('content'),
                    'custom_content' => $this->input->post('custom_content'),
                    'quantity' => $this->input->post('quantity'),
                    'type' => $this->input->post('type'),
                    'logistics' => $this->input->post('logistics'),
                    'customer_id' => $this->input->post('recipient'),
                    'approved_by' => $this->input->post('approved_by'),
                    'date_created' => date("Y-m-d H:i:s"),
                );

                if ($this->db->insert('finance_dispatch', $data)) {
                    $this->session->set_flashdata('message', 'Dispatch Added');
                } else {
                    $data['flash_message'] = false;
                }


                //$this->M_dispatch->add_dispatch();

                redirect('production/C_dispatch', 'refresh');
            }
        }
        // $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();

        $data['title'] = 'Add New Dispatch';
        $data['main'] = 'Add New Dispatch';

        $this->load->view('templates/header', $data);
        $this->load->view('production/dispatch/create', $data);
        $this->load->view('templates/footer');
    }

    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));

        if ($this->input->server('REQUEST_METHOD') === 'POST') {
            //form Validation
            $this->form_validation->set_rules('dispatch_date', 'Date Issued', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');

            //after form Validation run
            if ($this->form_validation->run()) {
                $data = array(
                    'dispatch_date' => $this->input->post('dispatch_date'),
                    'product_id' => $this->input->post('product_id'),
                    'content' => $this->input->post('content'),
                    'custom_content' => $this->input->post('custom_content'),
                    'quantity' => $this->input->post('quantity'),
                    'type' => $this->input->post('type'),
                    'logistics' => $this->input->post('logistics'),
                    'customer_id' => $this->input->post('recipient'),
                    'approved_by' => $this->input->post('approved_by'),
                    'date_updated' => date("Y-m-d H:i:s"),
                );

                if ($this->db->update('finance_dispatch', $data, array('id' => $_POST['id']))) {
                    $this->session->set_flashdata('message', 'Dispatch Updated');
                } else {
                    $data['flash_message'] = false;
                }

                //$this->M_dispatch->update_dispatch();
                //$this->session->set_flashdata('message','dispatch Updated');
                redirect('production/C_dispatch', 'refresh');
            }
        }
        $data['title'] = 'Update Dispatch';
        $data['main'] = 'Update Dispatch';

        $data['update_dispatch'] = $this->M_dispatch->get_dispatch($id);
        //$data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['customersDDL'] = $this->M_prod_customers->get_prod_customersDDL();
        

        $this->load->view('templates/header', $data);
        $this->load->view('production/dispatch/edit', $data);
        $this->load->view('templates/footer');
    }

    function delete($id)
    {
        $this->M_dispatch->delete_dispatch($id);
        $this->session->set_flashdata('message', 'Dispatch Deleted');
        redirect('production/C_dispatch', 'refresh');
    }
}
