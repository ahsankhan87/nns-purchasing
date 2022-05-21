<div class="row">
    <div class="col-sm-12">
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><?php echo $main; ?>
				</div>
				
			</div>
        <div class="portlet-body flip-scroll">
                
        <table class="table table-bordered table-striped table-condensed flip-content"  id="sample_">
        <!-- <thead class="flip-content">
            <tr>
                <th>Item</th>
                <th>Price</th>
            </tr>
        </thead>
         -->
        <tbody class="text-center">
            <tr>
                <?php
                echo '<td>Payment For</td>';
                echo '<td>'.$this->M_paymentfor->get_paymentforName($expenses[0]['payment_for_id']).'</td>';
                ?>    
            </tr>
            <tr>
                <?php
                echo '<td>Amount</td>';
                echo '<td>₱'.number_format($expenses[0]['amount'],2).'</td>';
                ?>    
            </tr>
        <?php 
        $products_total = 0;
        foreach($expenses_items as $key => $list)
        {
            $total = (double)($list['amount']);
            echo '<tr>';
            echo '<td>'.$this->M_expenseItems->get_expenseItemsName($list['expense_item_id']).'</td>';
            echo '<td>₱'.number_format($list['amount'],2).'</td>';
            echo '</tr>';
            $products_total += $total;
        }
        ?>
        </tbody>
        <tfoot>
            <tr>
                <th>Total</th><th>₱<?php echo number_format($products_total,2); ?></th>
            </tr>
            <tr>
                <th>Change</th><th>₱<?php echo number_format($expenses[0]['change'],2); ?></th>
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
