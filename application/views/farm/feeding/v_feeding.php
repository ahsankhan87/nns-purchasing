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
                <?php echo anchor('farm/C_feeding/create',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>
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
                <th>IBN 1</th>
                <th>IBN Quantity 1</th>
                <th>IBN 2</th>
                <th>IBN Quantity 2</th>
                <th>IBN 3</th>
                <th>IBN Quantity 3</th>
                <th>Pond No.</th>
                <th>Final Quantity</th>
                <th>Unit</th>
                <th>Date</th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php
        
        foreach($feeding as $key => $list)
        {
            $inventory_1 = $this->M_inventory->get_inventory($list['ibn_1']);
            $inventory_2 = ($list['ibn_2'] == 0 ? '' : $this->M_inventory->get_inventory($list['ibn_2']));
            $inventory_3 =  ($list['ibn_3'] == 0 ? '' : $this->M_inventory->get_inventory($list['ibn_3']));
            $product = $this->M_products->get_product($list['item_id']);
            
           
            
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            echo '<td>'.@$product[0]['name'].'</td>';
            echo '<td>'.@$inventory_1[0]['ibn'].'</td>';
            echo '<td>'.$list['ibn_qty_1'].'</td>';
            echo '<td>'.@$inventory_2[0]['ibn'].'</td>';
            echo '<td>'.$list['ibn_qty_2'].'</td>';
            echo '<td>'.@$inventory_3[0]['ibn'].'</td>';
            echo '<td>'.$list['ibn_qty_3'].'</td>';
            echo '<td>'.$list['pond_no'].'</td>';
            echo '<td>'.number_format($list['ibn_qty_1']+$list['ibn_qty_2']+$list['ibn_qty_3'],5).'</td>';
            echo '<td>'.$this->M_units->get_unitName($list['unit_id']).'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['date'])).'</td>';
            
            echo '<td>';
            //if($_SESSION['role'] == 'admin'){
                echo anchor('farm/C_feeding/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
                echo  anchor('farm/C_feeding/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"');
                echo '</td>';
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
