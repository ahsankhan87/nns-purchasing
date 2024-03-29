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
                <?php echo anchor('farm/C_grinding/create',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>
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
                <th>Harvest Date</th>
                <th>Grinding Date</th>
                <th>Pond No.</th>
                <th>Bach Code</th>
                <th>Quantity</th>
                <th>Unit</th>
                <th>Delivery</th>
                <th>FSMS</th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php
        foreach($grinding as $key => $list)
        {
            //$product = $this->M_products->get_product($list['product_id']);
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['harvest_date'])).'</td>';
            echo '<td>'.($list['grinding_date'] == "0000-00-00" ? "" : date('m/d/Y',strtotime($list['grinding_date']))).'</td>';
            echo '<td>'.$list['pond_no'].'</td>';
            echo '<td>'.$list['batch_code'].'</td>';
            echo '<td>'.number_format($list['qty'],5).'</td>';
            echo '<td>'.$this->M_units->get_unitName($list['unit_id']).'</td>';
            //echo '<td>'.$this->M_prod_customers->get_prod_customerName($list['customer_id']).'</td>';
            echo '<td>'.$list['delivery_date'].'</td>';
            
            if($list['fsms'] == 'Approved')
            {
                $label= 'label label-success';
            }elseif($list['fsms'] == 'Pending')
            {
                $label= 'label label-primary';
                $color = "style='background-color:#f1d170 !important'";
                
            }elseif($list['fsms'] == 'Reject')
            {
                $label= 'label label-danger';
            }elseif($list['fsms'] == 'Quarantine')
            {
                $label= 'label label-warning';
            }else{
                 $label= 'label label-default';
                 $color = "";
            }
            echo '<td><label '.@$color.' class="'.$label.'">'.$list['fsms'].'</label></td>';
            
            //echo '<td>'.$list['status'].'</td>';
            
            echo '<td>';
            //if($_SESSION['role'] == 'admin'){
                echo anchor('farm/C_grinding/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
                echo  anchor('farm/C_grinding/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"');
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
