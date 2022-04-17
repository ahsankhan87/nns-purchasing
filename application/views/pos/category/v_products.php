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
       
        <?php
        //var_dump($products);
        if(count($products))
        {
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
                
        <table class="table table-bordered table-striped table-condensed flip-content"  id="sample_1">
        <thead class="flip-content">
            <tr>
                <th>id</th>
                <th><?php echo lang('name'); ?></th>
                
            </tr>
        </thead>
        
        <tbody>
        <?php
        foreach($products as $key => $list)
        {
            echo '<tr valign="top">';
            echo '<td>'.$list['item_id'].'</td>';
            echo '<td>';
            echo anchor('en/pos/Items/item_transactions/'.$list['item_id'],$list['name']);
            echo '</td>';
            
            echo '</tr>';
        }
        echo '</tbody> </table>';
        }
        ?>
        
        </div>
        <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
