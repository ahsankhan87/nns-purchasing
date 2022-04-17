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
        
        <p><?php echo anchor('trans/C_samples/create','Add New <i class="fa fa-plus"></i>','class="btn btn-success"'); ?></p>
        
       
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
                <th>Product Name</th>
                <th>Supplier</th>
                <th class="text-right">Quantity</th>
                <th>Unit</th>
                <th class="text-right">Price</th>
                <th>Currency</th>
                <th>Department</th>
                <th>Payment Status</th>
                <th>Delivery Status</th>
                <th>Approval</th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        
        <?php
        if(count($samples))
        {
        ?>
        <tbody  class="text-center">
        <?php
        foreach($samples as $key => $list)
        {
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            echo '<td>'.$list['item'].'</td>';
            echo '<td>'.$list['supplier'].'</td>';
            // echo '<td>'.$this->M_items->get_itemName($list['item_id']).'</td>';
            // echo '<td>'.$this->M_suppliers->get_supplierName($list['supplier_id']).'</td>';
            echo '<td  class="text-center">'.number_format($list['qty']).'</td>';
            echo '<td class="text-center">'.$this->M_units->get_unitName($list['unit_id']).'</td>';
            echo '<td  class="text-center">'.number_format($list['price'],2).'</td>';
            echo '<td class="text-center">'.$list['currency'].'</td>';
            echo '<td class="text-center">'.$this->M_category->get_CatNameByItem($list['department_id']).'</td>';
            
            if($list['payment_status'] == 'Paid'){
                    $label = "label label-success";
                }else if($list['payment_status'] == 'Unpaid'){
                    $label = "label label-danger";
                }else{
                    $label = "label label-default";
                }
                
            echo '<td class="text-center"><span class="'.$label.'">'.$list['payment_status'].'</span></td>';
            
            if($list['delivery_status'] == 'Delivered'){
                    $label = "label label-success";
                }else if($list['delivery_status'] == 'Pending'){
                    $label = "label label-danger";
                }else{
                    $label = "label label-default";
                }
            echo '<td class="text-center"><span class="'.$label.'">'.$list['delivery_status'].'</span></td>';
            
            if($list['approval'] == 'Approved'){
                    $label = "label label-success";
                }else if($list['approval'] == 'Pending'){
                    $label = "label label-warning";
                }else{
                    $label = "label label-danger";
                }
            echo '<td class="text-center"><span class="'.$label.'">'.$list['approval'].'</span></td>';
            echo '<td>'.anchor('trans/C_samples/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
            echo  anchor('trans/C_samples/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"'). '</td>';
            echo '</tr>';
        }
        echo '</tbody> ';
        }
        ?>
        </table>
        </div>
        <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
