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
				<div class="tools">
					<a href="javascript:;" class="collapse"></a>
					<a href="#portlet-config" data-toggle="modal" class="config"></a>
					<a href="javascript:;" class="reload"></a>
					<a href="javascript:;" class="remove"></a>
				</div>
			</div>
        <div class="portlet-body flip-scroll">
                
        <table class="table table-bordered table-striped table-condensed flip-content"  id="sample_2">
        <thead class="flip-content">
            <tr>
                <th>ID</th>
                <th>Item</th>
                <th>IBN</th>
                <!--<th>In</th>-->
                <th>Out Quantity</th>
                <th>Out Date</th>
                
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php 
        foreach($inventory as $key => $list)
        {
            $product = $this->M_products->get_product($list['prod_product_id']);
            $ibn = $this->M_feeding->get_feeding_by_ibn($list['ibn']);
            
            
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            echo '<td>'.@$product[0]['name'].'</td>';
            echo '<td>'.$list['ibn'].'</td>';
            // echo '<td>'.$list['in_qty'].'</td>';
            echo '<td>'.$list['out_qty'].'</td>';
            //echo '<td>'.$this->M_prod_customers->get_prod_customerName($list['customer_id']).'</td>';
            // echo '<td>'.date('m-d-Y',strtotime($list['delivery_date'])).'</td>';
            echo '<td>'.($list['out_date'] == '' ? '' : date('m/d/Y',strtotime($list['out_date']))).'</td>';
            
            // echo '<td>'.($list['in_qty']-$list['out_qty']).'</td>';
            
            
            echo '</tr>';
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
