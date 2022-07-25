<div class="row">
    <div class="col-sm-12">
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
                    <?php $customer = $this->M_prod_customers->get_prod_customerName($customer_id); ?>
					<i class="fa fa-cogs"></i><?php echo @$customer." Payment Detail"; ?>
				</div>
				
			</div>
        <div class="portlet-body flip-scroll">
                
        <table class="table table-bordered table-striped table-condensed flip-content"  id="sample_">
        <thead class="flip-content">
            <tr>
                <th>Date</th>
                <th>Invoice</th>
                <th>Description</th>
                <th>Amount`</th>
                <th>Delivery Date</th>
                <th>Payment Status</th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php 
        //var_dump($detail);
        $net_dr_total = 0;
        $net_cr_total = 0;
        foreach($detail as $key => $list)
        {
            $dr_total = (double)($list['debit']);
            $cr_total = (double)($list['credit']);
            echo '<tr valign="top">';
            echo '<td>'.date("m/d/Y",strtotime($list['date'])).'</td>';
            echo '<td><a href="'.site_url($langs.'/hr_finance/C_sales/detail/'.$list['invoice_no']).'">'.$list['invoice_no'].'</a></td>';
            echo '<td>'.$list['description'].'</td>';
            echo '<td>₱'.number_format(($dr_total == 0 ? $cr_total : $dr_total),2).'</td>';
            if($list['payment_status'] == 'Paid'){
                $label = "label label-success";
            }else {
                $label = "label label-danger";
            }

            echo '<td>'.$list['delivery_date'].'</td>';
            echo '<td> <span class="'.$label.'">' . $list['payment_status'] . '</span></td>';
            echo '</tr>';
            $net_dr_total += $dr_total;
            $net_cr_total += $cr_total;
        }
        ?>
        </tbody>
        <tfoot>
            <tr>
                <th></th>
                <th></th><th>Total</th>
                <th>₱<?php echo number_format($net_dr_total+$net_cr_total,2); ?></th>
                <th></th>
                <th></th>
                <th></th>
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