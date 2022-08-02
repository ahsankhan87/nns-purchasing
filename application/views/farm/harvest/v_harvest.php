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
                <?php echo anchor('farm/C_harvest/create',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>
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
                <th>Pond No.</th>
                <th>Unpressed Biomass </th>
                <th>Pressed Biomass</th>
                <th>Unit</th>
                <th>Status</th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php
        foreach($harvest as $key => $list)
        {
            //$product = $this->M_products->get_product($list['product_id']);
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['harvest_date'])).'</td>';
            echo '<td>'.$list['pond_no'].'</td>';
            echo '<td>'.number_format($list['unpressed_biomass'],5).'</td>';
            echo '<td>'.number_format($list['pressed_biomass'],5).'</td>';
            echo '<td>'.$this->M_units->get_unitName($list['unit_id']).'</td>';
            //echo '<td>'.$this->M_prod_customers->get_prod_customerName($list['customer_id']).'</td>';
            // echo '<td>'.date('m-d-Y',strtotime($list['delivery_date'])).'</td>';
            
            if($list['status'] == 'Approved')
            {
                $label= 'label label-success';
            }elseif($list['status'] == 'Reject')
            {
                $label= 'label label-danger';
            }else{
                 $label= 'label label-default';
            }
            echo '<td><label class="'.$label.'">'.$list['status'].'</label></td>';
            
            //echo '<td>'.$list['status'].'</td>';
            
            echo '<td>';
            //if($_SESSION['role'] == 'admin'){
                echo anchor('farm/C_harvest/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
                echo  anchor('farm/C_harvest/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"');
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
