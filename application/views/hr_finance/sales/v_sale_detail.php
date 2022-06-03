<div class="row">
    <div class="col-sm-12">
        <?php
        if($this->session->flashdata('message'))
        {
            echo "<div class='alert alert-success fade in'>";
            echo $this->session->flashdata('message');
            echo '</div>';
        }
        ?>
        
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><?php echo $main; ?>
				</div>
				
			</div>
        <div class="portlet-body flip-scroll">
                
        <table class="table table-bordered table-striped table-condensed flip-content"  id="sample_">
        <thead class="flip-content">
            <tr>
                <th>Date</th>
                <th>Invoice</th>
                <th>Customer</th>
                <th>Payment Terms</th>
                <th>Amount</th>
                <th>Delivery</th>
                <th>Balance</th>
                <th>Status</th>
                <th>Note</th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php 
        foreach($Sales as $key => $list)
        {
            echo '<tr valign="top">';
            echo '<td>'.date('m/d/Y',strtotime($list['sale_date'])).'</td>';
            echo '<td>'.$list['invoice_no'].'</td>';

            $customer = $this->M_prod_customers->get_prod_customerName($list['customer_id']);
            echo '<td>'.anchor('production/C_customers/payment_detail/'.$list['customer_id'],'<span class="">'.$customer.'</span>', '').'</td>';

            echo '<td>'.$this->M_payment_terms->get_payment_termsName($list['payment_terms_id']).'</td>';
            echo '<td>₱'.number_format($list['total_amount'],2).'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['delivery_date'])).'</td>';
            // echo '<td>'.($list['delivery_date'] == '' ? '' : date('m/d/Y',strtotime($list['delivery_date']))).'</td>';
            echo '<td>₱'.number_format($list['balance'],2).'</td>';
            
            if($list['status'] == 'Paid'){
                $label = "label label-success";
            }else {
                $label = "label label-danger";
            }
            echo '<td> <span class="'.$label.'">' . $list['status'] . '</span></td>';
            echo '<td>'.anchor('#','<span class="">View</span>', ' data-toggle="modal" data-target="#view_sales_'.$list['sale_id'].'"').'</td>';
            echo '</tr>';
        ?>
            <!--delivery_status_ Modal -->
            <div class="modal fade" id="view_sales_<?php echo $list['sale_id'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Invoice: <?php echo $list['invoice_no'];?> Sale Note</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p><?php echo $list['description'] ?></p>
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
        echo '</tbody> </table>';
        ?>
        </div>
        <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-sm-12">
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><?php echo "Order Details"; ?>
				</div>
				
			</div>
        <div class="portlet-body flip-scroll">
                
        <table class="table table-bordered table-striped table-condensed flip-content"  id="sample_">
        <thead class="flip-content">
            <tr>
                <th>Products</th>
                <th>Content</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Unit</th>
                <th>Amount</th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php 
        $products_total = 0;
        foreach($sales_items as $key => $list)
        {
            $total = (double)($list['quantity_sold']*$list['item_unit_price']);
            
            $product = $this->M_products->get_product($list['item_id']);
            echo '<tr valign="top">';
            echo '<td>'.@$product[0]['name'].'</td>';
            echo '<td>'.$list['item_content'].'</td>';
            echo '<td>'.number_format($list['quantity_sold'],2).'</td>';
            echo '<td>₱'.number_format($list['item_unit_price'],2).'</td>';
            echo '<td>'.$this->M_units->get_unitName($list['unit_id']).'</td>';
            echo '<td>₱'.number_format($total,2).'</td>';
            echo '</tr>';
            $products_total += $total;
        }
        ?>
        </tbody>
        <tfoot>
            <tr>
                <th></th><th></th>
                <th></th><th></th>
                <th>Products Total</th><th>₱<?php echo number_format($products_total,2); ?></th>
            </tr>
            
        </tfoot>        
        </table>
        </div>
        <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-sm-12">
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><?php echo "Charges"; ?>
				</div>
				
			</div>
        <div class="portlet-body flip-scroll">
                
        <table class="table table-bordered table-striped table-condensed flip-content"  id="sample_">
        <thead class="flip-content">
            <tr>
                <th>Charges</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php 
        $charges_total = 0;
        foreach($charges as $key => $list)
        {
            $total = (double)($list['qty']*$list['price']);
            echo '<tr>';
            echo '<tr valign="top">';
            echo '<td>'.$this->M_sales_charges->get_sales_chargesName($list['charges_id']).'</td>';
            echo '<td>'.$list['description'].'</td>';
            echo '<td>'.number_format($list['qty'],2).'</td>';
            echo '<td>₱'.number_format($list['price'],2).'</td>';
            echo '<td>₱'.number_format($total,2).'</td>';
            echo '</tr>';
            $charges_total += $total;
        }
        ?>
        </tbody>
        <tfoot>
            <tr>
                <th></th>
                <th></th><th></th>
                <th>Charges Total</th><th>₱<?php echo number_format($charges_total,2); ?></th>
            </tr>
        </tfoot>        
        </table>
        </div>
        <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-sm-12">
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><?php echo "Deductions"; ?>
				</div>
				
			</div>
        <div class="portlet-body flip-scroll">
                
        <table class="table table-bordered table-striped table-condensed flip-content"  id="sample_">
        <thead class="flip-content">
            <tr>
                <th>Deduction</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php 
        $deduction_total = 0;
        foreach($deduction as $key => $list)
        {
            $total = (double)($list['qty']*$list['price']);
            echo '<tr valign="top">';
            echo '<td>'.$this->M_sales_deductions->get_sales_deductionsName($list['deduction_id']).'</td>';
            echo '<td>'.$list['description'].'</td>';
            echo '<td>'.number_format($list['qty'],2).'</td>';
            echo '<td>₱'.number_format($list['price'],2).'</td>';
            echo '<td>₱'.number_format($total,2).'</td>';
            echo '</tr>';
            $deduction_total += $total;
        }
        ?>
        </tbody>
        <tfoot>
            <tr>
                <th></th>
                <th></th><th></th>
                <th>Deduction Total</th><th>₱<?php echo number_format($deduction_total,2); ?></th>
            </tr>
            <tr>
                <th></th>
                <th></th><th></th>
                <th>Grand Total</th><th>₱<?php echo number_format($products_total+$charges_total-$deduction_total,2); ?></th>
            </tr>
        </tfoot>        
        </table>
        </div>
        <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->