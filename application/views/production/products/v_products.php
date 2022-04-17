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
                <?php echo anchor('production/C_products/create',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>
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
                <!--<th>Brand</th>-->
                <th>Product/Brand</th>
                <th>Item Number</th>
                <th>Content</th>
                <th>Packaging</th>
                <th>On Stock</th>
                <th>FDA Validity</th>
                <th></th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        
        <tbody class="text-center">
        <?php
        foreach($products as $key => $list)
        {
            $fda_validity = ($list['fda_validity']  == '0000-00-00' ? '' : date('m/d/Y',strtotime($list['fda_validity'])));
            
            echo '<tr valign="top">';
            echo '<td>'.$list['id'].'</td>';
            // echo '<td>'.$list['brand'].'</td>';
            echo '<td>'.$list['name'].'</td>';
            echo '<td>'.$list['item_number'].'</td>';
            echo '<td>'.$list['content'].'</td>';
            echo '<td>'.$list['packaging'].'</td>';
            echo '<td>'.number_format((float)$list['current_stock']).'</td>';
            
            $date1 = strtotime($fda_validity);
            $date2 = strtotime(date('Y-m-d'));
            $date_diff = $date1-$date2;
            
            if($date_diff > 0){
                $label = '<i class="fa fa-check text-success"></i>';
            }else{
                $label = '<i class="fa fa-exclamation text-danger"></i>';
            }
            echo '<td>'.$fda_validity.'</td>';
            
            echo '<td>'.$label.'</td>';
            
            echo '<td>';
            //if($_SESSION['role'] == 'admin'){
                echo anchor('production/C_products/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
                echo  anchor('production/C_products/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"'); 
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
