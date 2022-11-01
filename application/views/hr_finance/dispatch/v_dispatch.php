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
                <?php echo anchor('hr_finance/C_dispatch/create',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>
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
                <th>Dispatch Date</th>
                <th>Product</th>
                <th>Content</th>
                <th>Custom Content</th>
                <th>Quantity</th>
                <th>Type of Dispatch</th>
                <th>Logistics</th>
                <th>Reciepient</th>
                <th>Approved By</th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php
        foreach($dispatch as $key => $list)
        {
            //$product = $this->M_products->get_product($list['product_id']);
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['dispatch_date'])).'</td>';
            echo '<td>'.$this->M_products->get_productName($list['product_id']).'</td>';
            echo '<td>'.$list['content'].'</td>';
            echo '<td>'.$list['custom_content'].'</td>';
            echo '<td>'.number_format($list['quantity']).'</td>';
            echo '<td>'.$list['type'].'</td>';
            echo '<td>'.$list['logistics'].'</td>';
            echo '<td>'.$this->M_prod_customers->get_prod_customerName($list['customer_id']).'</td>';
            echo '<td>'.$list['approved_by'].'</td>';
            
            // if($list['fsms'] == 'Approved')
            // {
            //     $label= 'label label-success';
            // }elseif($list['fsms'] == 'Pending')
            // {
            //     $label= 'label label-primary';
            //     $color = "style='background-color:#f1d170 !important'";
                
            // }elseif($list['fsms'] == 'Reject')
            // {
            //     $label= 'label label-danger';
            // }elseif($list['fsms'] == 'Quarantine')
            // {
            //     $label= 'label label-warning';
            // }else{
            //      $label= 'label label-default';
            //      $color = "";
            // }
            //echo '<td><label '.@$color.' class="'.$label.'">'.$list['fsms'].'</label></td>';
            
            //echo '<td>'.$list['status'].'</td>';
            
            echo '<td>';
            //if($_SESSION['role'] == 'admin'){
                echo anchor('hr_finance/C_dispatch/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
                echo  anchor('hr_finance/C_dispatch/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"');
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
