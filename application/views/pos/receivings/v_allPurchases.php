<div class="row">
    <div class="col-sm-12">
       <?php
        if($this->session->flashdata('message'))
        {
            echo "<div class='alert alert-success fade in'>";
            echo $this->session->flashdata('message');
            echo '</div>';
        }
        if($this->session->flashdata('error'))
        {
            echo "<div class='alert alert-danger fade in'>";
            echo $this->session->flashdata('error');
            echo '</div>';
        }
        ?>
        <p>
        <!-- <div class="btn-group">
			<button type="button" class="btn btn-success">New Transaction</button>
			<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
			<ul class="dropdown-menu" role="menu">
				<li>
					<?php echo anchor('trans/C_receivings/index/cash','Cash Purchases','class="hidden-print"'); ?>
				</li>
				<li>
					<?php echo anchor('trans/C_receivings/index/credit','Credit Purchases','class="hidden-print"'); ?>
				</li>
				<li>
					<?php echo anchor('trans/C_receivings/index/cashReturn','Cash Purchases Return','class="hidden-print"'); ?>
				</li>
				<li>
					<?php echo anchor('trans/C_receivings/index/creditReturn','Credit Purchases Return','class="hidden-print"'); ?>
				</li>
			</ul>
		</div>
		/btn-group -->
        <?php echo anchor('trans/C_receivings/index/cash','New Purchase','class="btn btn-success hidden-print"'); ?>
       </p>
        
       
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><span id="print_title"><?php echo $title; ?></span>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a>
					<a href="#portlet-config" data-toggle="modal" class="config"></a>
					<a href="javascript:;" class="reload"></a>
					<a href="javascript:;" class="remove"></a>
				</div>
			</div>
        <div class="portlet-body flip-scroll">
            
        <table class="table table-striped table-condensed table-bordered flip-content" id="sample_2">
            <thead class="flip-content">
                <tr>
                    <th>S.No</th> 
                    <th>PO #</th>
                    <th>Date</th>
                    <th>Supplier</th>
                    <th class="text-right">Total</th>
                    <!--<th>Currency</th> -->
                    <th>Payment</th> 
                    <th>Delivery</th>
                    <th>Quotation</th>
                    <th>FAN</th>
                    <th>SSDT</th>
                    <th>Supplier PI</th>
                    <th>Documents</th>
                    <th>ETA</th>
                    <th>ETD</th>
                    <th>AWB</th>
                    <th class="hidden-print"></th>
                </tr>
            </thead>
            <tbody class="text-center">
        <?php
        $sno = 1;
        foreach($receivings as $key => $list)
        {   
            $sno++;
            $coa = ($list['coa'] == '1' ? "COA, " : "");
            $msds = ($list['msds'] == '1' ? "MSDS, " : "");
            $flowchart = ($list['flowchart'] == '1' ? "Flowchart, " : "");
            $forme = ($list['forme'] == '1' ? "Form E, " : "");
            $halal = ($list['halal'] == '1' ? "Halal" : "");
            
            echo '<tr>';
            echo '<td>'.$list['receiving_id'].'</td>';
            //echo '<td>'.$list['invoice_no'].'</td>';
            echo '<td><a href="'.site_url('trans/C_receivings/detail/'.$list['receiving_id']).'">'.$list['invoice_no'].'</a></td>';
            echo '<td>'.date('m/d/Y',strtotime($list['receiving_date'])).'</td>';
           
            $supplier_name = $this->M_suppliers->get_supplierName($list['supplier_id']);
            echo '<td>'.@$supplier_name.'</td>';
            echo '<td>'.$list['symbol'].number_format($list['net_amount'],2).'</td>';
            //echo '<td>'.$list['symbol'].'</td>';
            if($list['payment_status'] == 'Paid'){
                
                $label = "label label-success";
                }else if($list['payment_status'] == 'Unpaid'){
                    $label = "label label-danger";
                }else{
                    $label = "label label-default";
                }
            // echo '<td><span class="'.$label.'">'.$list['payment_status'].'</span></td>';
            echo '<td>'.anchor('#','<span class="'.$label.'">'. $list['payment_status'].'</span>', ' data-toggle="modal" data-target="#payment_status_'.$sno.'"').'</td>';
                
                if($list['delivery_status'] == 'Delivered'){
                    $label = "label label-success";
                }else if($list['delivery_status'] == 'Pending'){
                    $label = "label label-danger";
                }else{
                    $label = "label label-default";
                }
            echo '<td>'.anchor('#','<span class="'.$label.'">'. $list['delivery_status'].'</span>', ' data-toggle="modal" data-target="#delivery_status_'.$sno.'"').'</td>';
            
                if($list['quotation'] == 'Approved'){
                    $label = "label label-success";
                }else if($list['quotation'] == 'Pending'){
                    $label = "label label-danger";
                }else{
                    $label = "label label-default";
                }
            $fan = base_url('images/fan/'.$list['fan']);
            $ssdt = base_url('images/ssdt/'.$list['ssdt']);
            $supplier_pi = base_url('images/supplier_pi/'.$list['supplier_pi']);
            $quotation_file = base_url('images/quotation/'.$list['quotation_file']);
            
            //echo '<td><span class="'.$label.'">'.$list['quotation'].'</span></td>';
            
            $quote_file = ($list['quotation_file'] != "" ? "<a href='".$quotation_file."' target='_blank'>Download<a/>" : "no file");
            $fan_file = ($list['fan'] != "" ? "<a href='".$fan."' target='_blank'>Download<a/>" : "no file");
            $ssdt_file = ($list['ssdt'] != "" ? "<a href='".$ssdt."' target='_blank'>Download<a/>" : "no file");
            $supplier_pi_file = ($list['supplier_pi'] != "" ? "<a href='".$supplier_pi."' target='_blank'>Download<a/>" : "no file");
            
            echo '<td>'.$quote_file.'</td>';
            echo '<td>'.$fan_file.'</td>';
            echo '<td>'.$ssdt_file.'</td>';
            echo '<td>'.$supplier_pi_file.'</td>';
            
            echo '<td>'.$coa.' '.$msds.' '.$flowchart.' '.$forme.' '.$halal.'</td>';
            echo '<td>'.$list['eta'].'</td>';
            echo '<td>'.$list['etd'].'</td>';
            echo '<td>'.$list['awb'].'</td>';
            echo '<td>';
            echo '<a href="'.site_url().$langs.'/trans/C_receivings/editPurchase/' . $list['receiving_id'] .'" title="Edit Purchase" ><i class=\'fa fa-pencil-square-o fa-fw\'></i></a> | ';
            echo '<a href="'.site_url().$langs.'/trans/C_receivings/delete_by_receiving_id/'.$list['receiving_id'] .'/'. $list['invoice_no'] .'" onclick="return confirm(\'Are you sure you want to permanent delete? All entries will be deleted permanently\')"; title="Permanent Delete"><i class=\'fa fa-trash-o fa-fw\'></i></a>';
            echo '</td>';
        ?>  
        <!--delivery_status_ Modal -->
        <div class="modal fade" id="delivery_status_<?php echo $sno;?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delivery Status</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                    <form class="form-vertical" action="">
                        
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="Delivery">Delivery Date:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="Delivery Date" value="<?php echo $list['delivery_date']; ?>" readonly id="Delivery Date">
                            </div>
                        </div>
                    </form>
                    </br>
                    </br>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
              </div>
            </div>
          </div>
        </div>
           
        <!--delivery_status_ Modal -->
        <div class="modal fade" id="payment_status_<?php echo $sno;?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Payment Date</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                    <form class="form-vertical" action="">
                        
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="payment_date">Payment Date:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="payment_date" value="<?php echo $list['payment_date']; ?>" readonly id="payment_date">
                            </div>
                        </div>
                    </form>
                    </br>
                    </br>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
              </div>
            </div>
          </div>
        </div>
            
        <?php    
        } 
            
            echo '</tbody>';
            // echo '<tfoot>
            //         <tr>
            //             <th></th><th></th><th></th>
            //             <th></th><th>Total</th><th></th>
            //             <th></th>
            //         </tr>
            //     </tfoot>';
           
            ?>
                </tbody>
                </table>
                </div>
            </div>
          
        </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
