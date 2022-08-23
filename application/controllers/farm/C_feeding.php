<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class C_feeding extends MY_Controller{
    
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
        $fiscal_dates = "(From: ".date('d-m-Y',strtotime($start_date)) ." To:" .date('d-m-Y',strtotime($to_date)).")";
        
        $data['title'] = 'List of Feeding';
        $data['main'] = 'List of Feeding';
        
        $data['feeding'] = $this->M_feeding->get_feeding(FALSE,$start_date,$to_date);
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/feeding/v_feeding',$data);
        $this->load->view('templates/footer');
    }
    
    public function get_ibn_by_item_id($item_id,$ibn=null)
	{
        echo json_encode($this->M_inventory->get_inventory_by_item_id($item_id,$ibn));
    }

    
    function create()
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            
            //form Validation
            $this->form_validation->set_rules('item_id', 'Item', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'date'=>$this->input->post('date'),
                        'item_id'=>$this->input->post('item_id'),
                        'ibn_1'=>$this->input->post('ibn_1'),
                        'ibn_2'=>$this->input->post('ibn_2'),
                        'ibn_3'=>$this->input->post('ibn_3'),
                        'ibn_qty_1'=>$this->input->post('ibn_qty_1'),
                        'ibn_qty_2'=>$this->input->post('ibn_qty_2'),
                        'ibn_qty_3'=>$this->input->post('ibn_qty_3'),
                        'pond_no'=>$this->input->post('pond_no'),
                        'unit_id'=>$this->input->post('unit_id'),
                        
                        'date_created'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->insert('farm_feeding',$data)) {
                    
                    $this->session->set_flashdata('message','Feeding Added');
                    $feeding_id = $this->db->insert_id();
                        
                        if($this->input->post('ibn_qty_1') > 0)
                        {
                            $old_out_qty = $this->M_inventory->get_outqty_by_ibn($this->input->post('ibn_1'));
                            $data = array(  
                                'out_qty'=>($old_out_qty+$this->input->post('ibn_qty_1')),
                                'out_date'=>$this->input->post('date'),
                             );
                            
                            $this->db->update('farm_inventory',$data,array('id'=>$this->input->post('ibn_1')));
                            
                            ///////////////////////////
                            //////////////////////////
                            //SAVE DATA INTO INVENTORY DETAIL TABLE
                            $data = array(  
                                'inventory_id'=>$this->input->post('ibn_1'),
                                'out_qty'=>$this->input->post('ibn_qty_1'),
                                'out_date'=>$this->input->post('date'),
                                'feeding_id'=>$feeding_id,
                             );
                            
                            $this->db->insert('farm_inventory_detail',$data);
                            /////////////////////
                            //////////////////////
                        }
                        if($this->input->post('ibn_qty_2') > 0)
                        {
                            $old_out_qty_2 = @$this->M_inventory->get_outqty_by_ibn($this->input->post('ibn_2'));
                            $data = array(  
                                'out_qty'=>($old_out_qty_2+$this->input->post('ibn_qty_2')),
                                'out_date'=>$this->input->post('date'),
                             );
                            
                            $this->db->update('farm_inventory',$data,array('id'=>$this->input->post('ibn_2')));
                            
                            ///////////////////////////
                            //////////////////////////
                            //SAVE DATA INTO INVENTORY DETAIL TABLE
                            $data = array(  
                                'inventory_id'=>$this->input->post('ibn_2'),
                                'out_qty'=>$this->input->post('ibn_qty_2'),
                                'out_date'=>$this->input->post('date'),
                                'feeding_id'=>$feeding_id,
                             );
                            
                            $this->db->insert('farm_inventory_detail',$data);
                            /////////////////////
                            //////////////////////
                            
                        }
                        if($this->input->post('ibn_qty_3') > 0)
                        {
                            $old_out_qty_3 = @$this->M_inventory->get_outqty_by_ibn($this->input->post('ibn_3'));
                            $data = array(  
                                'out_qty'=>($old_out_qty_3+$this->input->post('ibn_qty_3')),
                                'out_date'=>$this->input->post('date'),
                             );
                            
                            $this->db->update('farm_inventory',$data,array('id'=>$this->input->post('ibn_3')));
                            
                            ///////////////////////////
                            //////////////////////////
                            //SAVE DATA INTO INVENTORY DETAIL TABLE
                            $data = array(  
                                'inventory_id'=>$this->input->post('ibn_3'),
                                'out_qty'=>$this->input->post('ibn_qty_3'),
                                'out_date'=>$this->input->post('date'),
                                'feeding_id'=>$feeding_id,
                             );
                            
                            $this->db->insert('farm_inventory_detail',$data);
                            /////////////////////
                            //////////////////////
                            
                        }
                        
                         
                    }else{
                        $data['flash_message'] = false;
                    }
                  
                
            //$this->M_feeding->add_feeding();
            
            redirect('farm/C_feeding','refresh');
        }
        }
        // $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['inventoryDDL'] = $this->M_inventory->get_inventoryProductDDL();
        //$data['ibnDDL'] = $this->M_inventory->get_ibnDDL();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        
        $data['title'] = 'Add New Feeding';
        $data['main'] = 'Add New Feeding';
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/feeding/create',$data);
        $this->load->view('templates/footer');
    }
    
    function edit($id = NULL)
    {
        $data = array('langs' => $this->session->userdata('lang'));
        
        if($this->input->server('REQUEST_METHOD') === 'POST')
        {
            //form Validation
            $this->form_validation->set_rules('item_id', 'Item', 'required');
            $this->form_validation->set_error_delimiters('<div class="alert alert-danger"><a class="close" data-dismiss="alert">�</a><strong>', '</strong></div>');
            
            //after form Validation run
            if($this->form_validation->run())
            {
                  $data = array(  
                        'date'=>$this->input->post('date'),
                        'item_id'=>$this->input->post('item_id'),
                        'ibn_1'=>$this->input->post('ibn_1'),
                        'ibn_2'=>$this->input->post('ibn_2'),
                        'ibn_3'=>$this->input->post('ibn_3'),
                        'ibn_qty_1'=>$this->input->post('ibn_qty_1'),
                        'ibn_qty_2'=>$this->input->post('ibn_qty_2'),
                        'ibn_qty_3'=>$this->input->post('ibn_qty_3'),
                        'pond_no'=>$this->input->post('pond_no'),
                        'unit_id'=>$this->input->post('unit_id'),
                        'date_updated'=>date("Y-m-d H:i:s"),
                     );
                  
                  if($this->db->update('farm_feeding',$data,array('id'=>$_POST['id']))) {
                        $this->session->set_flashdata('message','Feeding Updated');
                                                
                        if($this->input->post('ibn_qty_1') > 0)
                        {
                            $old_out_qty = $this->M_inventory->get_outqty_by_ibn($this->input->post('ibn_1'));
                            $data1 = array(  
                                'out_qty'=>($old_out_qty-$this->input->post('old_ibn_qty_1'))+$this->input->post('ibn_qty_1'),
                                'out_date'=>date("Y-m-d H:i:s"),
                             );
                            
                            $this->db->update('farm_inventory',$data1,array('id'=>$this->input->post('ibn_1')));
                            
                            ///////////////////////////
                            //////////////////////////
                            //SAVE DATA INTO INVENTORY DETAIL TABLE
                            $data = array(  
                                // 'inventory_id'=>$this->input->post('ibn_1'),
                                'out_qty'=>$this->input->post('ibn_qty_1'),
                                'out_date'=>$this->input->post('date'),
                                // 'feeding_id'=>$feeding_id,
                             );
                            
                            $this->db->update('farm_inventory_detail',$data,array('feeding_id'=>$_POST['id']));
                            /////////////////////
                            //////////////////////
                            
                        }
                        if($this->input->post('ibn_qty_2') > 0)
                        {
                            $old_out_qty = $this->M_inventory->get_outqty_by_ibn($this->input->post('ibn_2'));
                            $data2 = array(  
                                'out_qty'=>($old_out_qty-$this->input->post('old_ibn_qty_2'))+$this->input->post('ibn_qty_2'),
                                'out_date'=>date("Y-m-d H:i:s"),
                             );
                            
                            $this->db->update('farm_inventory',$data2,array('id'=>$this->input->post('ibn_2')));
                            
                            ///////////////////////////
                            //////////////////////////
                            //SAVE DATA INTO INVENTORY DETAIL TABLE
                            $data = array(  
                                // 'inventory_id'=>$this->input->post('ibn_2'),
                                'out_qty'=>$this->input->post('ibn_qty_2'),
                                'out_date'=>$this->input->post('date'),
                                // 'feeding_id'=>$feeding_id,
                             );
                            
                            $this->db->update('farm_inventory_detail',$data,array('feeding_id'=>$_POST['id']));
                            /////////////////////
                            //////////////////////
                            
                        }
                        if($this->input->post('ibn_qty_3') > 0)
                        {
                            $old_out_qty = $this->M_inventory->get_outqty_by_ibn($this->input->post('ibn_3'));
                            $data3 = array(  
                                'out_qty'=>($old_out_qty-$this->input->post('old_ibn_qty_3'))+$this->input->post('ibn_qty_3'),
                                'out_date'=>date("Y-m-d H:i:s"),
                             );
                            
                            $this->db->update('farm_inventory',$data3,array('id'=>$this->input->post('ibn_3')));
                            
                            ///////////////////////////
                            //////////////////////////
                            //SAVE DATA INTO INVENTORY DETAIL TABLE
                            $data = array(  
                                // 'inventory_id'=>$this->input->post('ibn_3'),
                                'out_qty'=>$this->input->post('ibn_qty_3'),
                                'out_date'=>$this->input->post('date'),
                                // 'feeding_id'=>$feeding_id,
                             );
                            
                            $this->db->update('farm_inventory_detail',$data,array('feeding_id'=>$_POST['id']));
                            /////////////////////
                            //////////////////////
                            
                        }
                        
                    }else{
                        $data['flash_message'] = false;
                    }
                    
            //$this->M_feeding->update_feeding();
            //$this->session->set_flashdata('message','feeding Updated');
            redirect('farm/C_feeding','refresh');
        }
        }
        $data['title'] = 'Update Feeding';
        $data['main'] = 'Update Feeding';
        
        $data['update_feeding'] = $this->M_feeding->get_feeding($id);      
        // $data['productsDDL'] = $this->M_products->get_productsDDL();
        $data['unitsDDL'] = $this->M_units->get_activeunitsDDL();
        $data['inventoryDDL'] = $this->M_inventory->get_inventoryProductDDL();
        $data['ibnDDL'] = $this->M_inventory->get_ibnDDL();
        
        
        $this->load->view('templates/header',$data);
        $this->load->view('farm/feeding/edit',$data);
        $this->load->view('templates/footer');
    }
    
    function delete($id)
    {
        $feeding = $this->M_feeding->get_feeding($id);
        foreach($feeding as $key => $list)
        {
        
            if($list['ibn_qty_1'] > 0)
            {
                $old_out_qty = $this->M_inventory->get_outqty_by_ibn($list['ibn_1']);
                $data1 = array(  
                    'out_qty'=>$old_out_qty-$list['ibn_qty_1'],
                    // 'out_date'=>$this->input->post('date'),
                 );
                
                $this->db->update('farm_inventory',$data1,array('id'=>$list['ibn_1']));
                
                
            }
            if($list['ibn_qty_2'] > 0)
            { 
                $old_out_qty = $this->M_inventory->get_outqty_by_ibn($list['ibn_2']);
                $data2 = array(  
                    'out_qty'=>$old_out_qty-$list['ibn_qty_2'],
                    // 'out_date'=>$this->input->post('date'),
                 );
                
                $this->db->update('farm_inventory',$data2,array('id'=>$list['ibn_2']));
            }
            if($list['ibn_qty_3'] > 0)
            {
                $old_out_qty = $this->M_inventory->get_outqty_by_ibn($list['ibn_3']);
                $data3 = array(  
                    'out_qty'=>$old_out_qty-$list['ibn_qty_3'],
                    // 'out_date'=>$this->input->post('date'),
                 );
                
                $this->db->update('farm_inventory',$data3,array('id'=>$list['ibn_3']));
            }
        }
        $old_out_qty = $this->M_inventory->get_outqty_by_ibn($this->input->post('ibn_2'));
        
        $this->db->delete('farm_inventory_detail',array('feeding_id'=>$id));
        $this->M_feeding->delete_feeding($id);
        $this->session->set_flashdata('message','Feeding Deleted');
        redirect('farm/C_feeding','refresh');
    }
}