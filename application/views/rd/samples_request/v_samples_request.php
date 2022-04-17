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
        <div class="row">
            <div class="col-sm-12">
                <?php echo anchor('rd/C_samples_request/create',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>
            </div>
        </div>
        </br>
        
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
                <!--<th>Status</th>-->
                <th>Delivery</th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php
        foreach($samples_request as $key => $list)
        {
            // $product = $this->M_products->get_product($list['product_id']);
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['date_request'])).'</td>';
            echo '<td>'.$list['customer_id'].'</td>';
            echo '<td>'.$list['product_id'].'</td>';
            // echo '<td>'.$product[0]['name'].'</td>';
            // echo '<td>'.$product[0]['content'].'</td>';
            // echo '<td>'.$product[0]['packaging'].'</td>';
            echo '<td>'.number_format($list['qty']).'</td>';
            echo '<td>'.$list['urgency'].'</td>';
            echo '<td>'.$list['requested_by'].'</td>';
            // echo '<td>'.$this->M_prod_customers->get_prod_customerName($list['customer_id']).'</td>';
            
            if($list['status'] == '')
            {
                $label = 'label label-success';
            }elseif($list['status'] == '')
            {
                $label = 'label label-primary';
            }elseif($list['status'] == '')
            {
                $label = 'label label-warning';
            }elseif($list['status'] == '')
            {
                $label = 'label label-danger';
            }else{
                $label = 'label label-default';
            }
            
            // echo '<td>'.$list['status'].'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['delivery_date'])).'</td>';
            
            //echo '<td>'.$list['status'].'</td>';
            
            echo '<td>';
            //if($_SESSION['role'] == 'admin'){
                echo anchor('rd/C_samples_request/transfer/'.$list['id'],'<i class="fa fa-check"></i>','title="Transfer to schedule" onclick="return confirm(\'Are you sure you want to transfer to schedule?\')"'). ' | ';
                echo  anchor('rd/C_samples_request/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
                echo  anchor('rd/C_samples_request/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"'). '</td>';
            //}
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
