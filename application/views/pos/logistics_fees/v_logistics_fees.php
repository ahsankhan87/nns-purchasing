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
        
        <p><?php echo anchor('trans/C_logistics_fees/create','Add New <i class="fa fa-plus"></i>','class="btn btn-success"'); ?></p>
        
        
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
                <th>PO #</th>
                <th>Supplier</th>
                <th>Shipping</th>
                <th>Billing Company</th>
                <th>Reference #</th>
                <th>Total</th>
                <th>Status</th>
                <th>Date</th>
                <th>View</th>
                <th></th>
            </tr>
        </thead>
         <?php
        if(count($logistics_fees))
        {
        ?>
        <tbody>
        <?php
        foreach($logistics_fees as $key => $list)
        {
            $supplier_receiving = $this->M_receivings->get_receiving_supplier(@$list['receiving_id']);
            echo '<tr  class="text-center">';
            echo '<td></td>';
            echo '<td>'.@$supplier_receiving[0]['invoice_no'].'</td>';
            echo '<td>'.$this->M_suppliers->get_supplierName(@$supplier_receiving[0]['supplier_id']).'</td>';
            //echo '<td>'.$this->M_category->get_CatNameByItem($list['department_id']).'</td>';
            echo '<td>'.$list['shipping'].'</td>';
            echo '<td>'.$list['billing_company'].'</td>';
            echo '<td>'.$list['reference_no'].'</td>';
            echo '<td>₱'.number_format($list['total'],2).'</td>';
            
            if($list['payment_status'] == 'Paid'){
                    $label = "label label-success";
                }else if($list['payment_status'] == 'Unpaid'){
                    $label = "label label-danger";
                }else{
                    $label = "label label-default";
                }
            echo '<td><span class="'.$label.'">'.$list['payment_status'].'</span></td>';
            echo '<td>'.date("m/d/Y",strtotime($list['payment_date'])).'</td>';
            echo '<td>'.anchor('trans/C_logistics_fees/edit_note/'.$list['id'],'View'). '</td>';
            echo '<td>'.anchor('trans/C_logistics_fees/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
            echo  anchor('trans/C_logistics_fees/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"'). '</td>';
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
