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
                <th>Date Request</th>
                <th>Customer</th>
                <th>Product</th>
                <!--<th>Content</th>-->
                <!--<th>Packaging</th>-->
                <th>Quantity</th>
                <th>Urgency</th>
                <th>Requested By</th>
                <th>Status</th>
                <th>Delivery</th>
                <th></th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php
        foreach($samples_request as $key => $list)
        {
            $product = $this->M_products->get_product($list['product_id']);
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['date_request'])).'</td>';
            echo '<td>'.$list['customer_id'].'</td>';
            echo '<td>'.$list['product_id'].'</td>';
            // echo '<td>'.@$product[0]['name'].'</td>';
            // echo '<td>'.@$product[0]['content'].'</td>';
            // echo '<td>'.@$product[0]['packaging'].'</td>';
            echo '<td>'.number_format($list['qty']).'</td>';
            echo '<td>'.$list['urgency'].'</td>';
            echo '<td>'.$list['requested_by'].'</td>';
            // echo '<td>'.$this->M_prod_customers->get_prod_customerName($list['customer_id']).'</td>';
            echo '<td><label class="label label-success">'.$list['status'].'</label></td>';
            echo '<td>'.date('m/d/Y',strtotime($list['delivery_date'])).'</td>';
            
            //echo '<td>'.$list['status'].'</td>';
            
            echo '<td>';//.anchor('rd/C_samples_request/transfer/'.$list['id'],'<i class="fa fa-check"></i>','title="Transfer" onclick="return confirm(\'Are you sure you want to transfer?\')"'). ' | ';
            echo  anchor('rd/C_rd_history/edit_note/'.$list['id'],'Note | ');
            //if($_SESSION['role'] == 'admin'){
                echo  anchor('rd/C_rd_history/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
                echo  anchor('rd/C_rd_history/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"');
            //}
            echo  '</td>';
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
