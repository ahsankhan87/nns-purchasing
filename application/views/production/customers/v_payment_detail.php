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
                <th>Unpaid</th>
                <th>Paid</th>
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
            echo '<td>'.$list['date'].'</td>';
            echo '<td>'.$list['invoice_no'].'</td>';
            echo '<td>'.$list['description'].'</td>';
            echo '<td>'.number_format($dr_total,2).'</td>';
            echo '<td>'.number_format($cr_total,2).'</td>';
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
                <th><?php echo number_format($net_dr_total,2); ?></th>
                <th><?php echo number_format($net_cr_total,2); ?></th>
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