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
        <!--<div class="row">-->
        <!--    <div class="col-sm-12">-->
        <!--        <?php echo anchor('production/C_production_schedule/create',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>-->
        <!--    </div>-->
        <!--</div>-->
        <!--</br>-->
        
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
                <th>Date</th>
                <th>Product</th>
                <th>Content</th>
                <th>Packaging</th>
                <th>Item Number</th>
                <th>BMF</th>
                <th>Quantity</th>
                <!--<th>On Stock</th>-->
                <th>Delivery Date</th>
                <th>Status</th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php
        foreach($production_schedule as $key => $list)
        {
            $product = $this->M_products->get_product($list['product_id']);
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['date'])).'</td>';
            echo '<td>'.@$product[0]['name'].'</td>';
            echo '<td>'.@$product[0]['content'].'</td>';
            echo '<td>'.@$product[0]['packaging'].'</td>';
            echo '<td>'.@$product[0]['item_number'].'</td>';
            echo '<td>'.$list['bmf'].'</td>';
            echo '<td>'.number_format($list['qty']).'</td>';
            // echo '<td>'.number_format($product[0]['current_stock']).'</td>';
            
            if($list['status'] == 'Finished')
            {
                $label = 'label label-success';
                $color = "";
            }
            else if($list['status'] == 'Scheduled')
            {
                $label = 'label label-warning';
                $color = "style='background-color:#d06407 !important'";
            }
            else if($list['status'] == 'On Process')
            {
                $label = 'label label-warning';
                $color = "style='background-color:#f7933d !important'";
            }
            else if($list['status'] == 'Bottling')
            {
                $label = 'label label-primary';
                $color = "style='background-color:#f1d170 !important'";
            }
            else if($list['status'] == 'Sorting')
            {
                $label = 'label label-warning';
                $color = "style='background-color:#d8a507 !important'";
            }
            else if($list['status'] == 'Quarantine')
            {
                $label = 'label label-danger';
                $color = "";
            }
            else{
                $label = 'label label-default';
                $color = "";
            }
            
            // echo '<td>'.number_format($product[0]['current_stock']).'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['delivery_date'])).'</td>';
            
            echo '<td><label '.$color.' class="'.$label.'">'.$list['status'].'</label></td>';
            
            echo '<td>';
            //if($_SESSION['role'] == 'admin'){
            echo anchor('production/C_production_schedule/edit_note/'.$list['id'],'Note'). ' | ';
            echo anchor('production/C_production_schedule/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
            echo anchor('production/C_production_schedule/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"');
            //}
            echo '</td>';
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
