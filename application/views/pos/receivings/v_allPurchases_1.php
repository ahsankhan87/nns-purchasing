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
            
        <table class="table table-striped table-condensed table-bordered flip-content" id="sample_receivings">
            <thead class="flip-content">
                <tr>
                    <!-- <th>S.No</th> -->
                    <th>PO #</th>
                    <th>Date</th>
                    <th>Supplier</th>
                    <th class="text-right">Total</th>
                    <th>Currency</th> 
                    <th>Payment</th> 
                    <th>Delivery</th>
                    <th>Quotation</th>
                    <th>Documents</th>
                    <th>ETA</th>
                    <th>ETD</th>
                    <th>AWB</th>
                    <th class="hidden-print"></th>
                </tr>
            </thead>
            <tbody  style="font-size:12px">
        <?php
        //$sno = 1;
//        foreach($receivings as $key => $list)
//        {
//            echo '<tr>';
//            //echo '<td>'.form_checkbox('p_id[]',$list['id'],false).'</td>';
//            //echo '<td><a href="'.site_url('trans/C_receivings/receipt/'.$list['invoice_no']).'">'.$list['invoice_no'].'</a></td>';
//            echo '<td>'.$sno++.'</td>';
//            echo '<td>'.$list['invoice_no'].'</td>';
//            echo '<td>'.date('d-m-Y',strtotime($list['receiving_date'])).'</td>';
//            //echo '<td><img src="'.base_url('images/supplier-images/thumbs/'.$list['supplier_image']).'" width="40" height="40"/></td>';
//            $supplier_name = $this->M_suppliers->get_supplierName($list['supplier_id']);
//            echo '<td>'.@$supplier_name.'</td>';
//            //echo '<td>'.$list['supplier_invoice_no'].'</td>';
//            echo '<td>'.@$this->M_employees->get_empName($list['employee_id']).'</td>';
//            echo '<td>'. $this->M_receivings->get_totalCostByReceivingID($list['invoice_no']). '</td>';
//            
//             } 
//            
//            echo '</tbody>';
//            echo '<tfoot>
//                    <tr>
//                        <th></th><th></th><th></th>
//                        <th></th><th>Total</th><th></th>
//                        <th></th>
//                    </tr>
//                </tfoot>';
           
            ?>
                </tbody>
                </table>
                </div>
            </div>
          
        </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
