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
                <?php echo anchor('farm/C_inventory/create',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>
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
                <th>Item</th>
                <th>IBN</th>
                <th>In Date</th>
                <th>In</th>
                <th>Out</th>
                <th>Waste</th>
                <th>Last Out Date</th>
                <th>Balance</th>
                <th>QC Check</th>
                <th>Status</th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php
        foreach($inventory as $key => $list)
        {
            $product = $this->M_products->get_product($list['prod_product_id']);
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            if(@$product[0]['name'] == ''){
                echo '<td>'.@$product[0]['name'].'</td>';
            }else{
                echo '<td>'.anchor('farm/C_inventory/detail/'.$list['id'],@$product[0]['name']). '</td>';
            }
            
            echo '<td>'.$list['ibn'].'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['in_date'])).'</td>';
            echo '<td>'.number_format($list['in_qty'],5).'</td>';
            echo '<td>'.number_format($list['out_qty'],5).'</td>';
            echo '<td>'.number_format($list['waste'],5).'</td>';
            //echo '<td>'.$this->M_prod_customers->get_prod_customerName($list['customer_id']).'</td>';
            // echo '<td>'.date('m-d-Y',strtotime($list['delivery_date'])).'</td>';
            echo '<td>'.($list['out_date'] == '' ? '' : date('m/d/Y',strtotime($list['out_date']))).'</td>';
            
            // echo '<td>'.($list['in_qty']-$list['out_qty']).'</td>';
            echo '<td>'.number_format($list['balance']-$list['waste'],5).'</td>';
            
            echo '<td>'.$list['moq'].'</td>';
            if($list['status'] == 'Approved')
            {
                $label= 'label label-success';
            }elseif($list['status'] == 'Pending')
            {
                $label= 'label label-primary';
                $color = "style='background-color:#f1d170 !important'";
                
            }elseif($list['status'] == 'Reject')
            {
                $label= 'label label-danger';
            }elseif($list['status'] == 'Quarantine')
            {
                $label= 'label label-warning';
            }else{
                 $label= 'label label-default';
                 $color = "";
            }
            echo '<td><label '.@$color.' class="'.$label.'">'.$list['status'].'</label></td>';
            
            echo '<td>';
            //if($_SESSION['role'] == 'admin'){
                echo anchor('farm/C_inventory/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
                echo  anchor('farm/C_inventory/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"');
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
