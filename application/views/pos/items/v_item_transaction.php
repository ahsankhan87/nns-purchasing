<div class="row">
    <div class="col-sm-12">
      
       <?php
        if($this->session->flashdata('message'))
        {
            echo "<div class='alert alert-success fade in'>";
            echo $this->session->flashdata('message');
            echo '</div>';
        }
        if($this->session->flashdata('error'))
        {
            echo "<div class='alert alert-danger fade in'>";
            echo $this->session->flashdata('message');
            echo '</div>';
        }
        ?> 
        <div class="row">
            <div class="col-sm-12">
    <!--            <div class="btn-group">-->
				<!--	<button type="button" class="btn btn-success">Add New <i class="fa fa-plus"></i></button>-->
				<!--	<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>-->
				<!--	<ul class="dropdown-menu" role="menu">-->
				<!--		<li>-->
				<!--			<?php echo anchor('pos/Items/create','Product'); ?>-->
				<!--		</li>-->
				<!--		<li>-->
				<!--			<?php echo anchor('pos/Items/createService','Services'); ?>-->
				<!--		</li>-->
						
				<!--	</ul>-->
				<!--</div>-->
				<!-- /btn-group -->
                <?php //echo anchor('pos/Categories','Categories','class="btn btn-primary"'); ?>
                
                <?php //echo anchor('pos/Items/create','Add New <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>
                
                <!-- Trigger the modal with a button 
                 <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#create-Product-Modal">Add New Product</button>
                -->
            </div>
            <!-- /.col-sm-12 -->
        </div>
        <!-- /.row -->
        
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><span id="print_title"><?php echo $main; ?></span>
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a>
					<a href="#portlet-config" data-toggle="modal" class="config"></a>
					<a href="javascript:;" class="reload"></a>
					<a href="javascript:;" class="remove"></a>
				</div>
			</div>
        <div class="portlet-body flip-scroll">
                
<?php
if(count($items))
{
?>
<table class="table table-striped table-condensed flip-content" id="sample_">
            <thead class="flip-content">
                <tr>
                    <!--<th>Trans ID</th>-->
                    <th>PO No</th>
                    <th>Product</th>
                    <th class="text-right">Quantity</th>
                    <th>Unit</th>
                    <th>Transaction Date</th>
                    <th>Delivery Date</th>
                    <th class="text-right">Total Value</th>
                </tr>
            </thead>
            
    <tbody class="text-center">
<?php
 $sno = 1;
 $total = 0;
 $total_qty = 0;
foreach($items as $key => $list)
{
    // echo '<td>'.form_checkbox('p_id[]',$list['id'],false).'</td>';
    
    //echo '<td>'.$list['trans_id'].'</td>';
    //echo '<td>'.$sno++.'</td>';
    echo '<td>';
    echo anchor('en/trans/C_receivings/detail/false/'.$list['invoice_no'],$list['invoice_no']);
    echo '</td>';
    $item = $this->M_items->get_items($list['trans_item']);
    echo '<td>'.@$item[0][name].'</td>';
    echo '<td class="">'.$list['trans_inventory'].'</td>';
    $item_detail = $this->M_items->get_itemDetail($list['trans_item']);
    echo '<td>'.$this->M_units->get_unitName(@$item_detail[0][unit_id]).'</td>';
    echo '<td>'.date("m/d/Y",strtotime($list['trans_date'])).'</td>';
    echo '<td>'.$list['delivery_date'].'</td>';
    $currency = $this->M_currencies->get_currencies($list['currency_id']);
    echo '<td class="">'.@$currency[0][symbol].number_format($list['cost_price']*$list['trans_inventory'],2).'</td>';
    echo '</tr>';
    
    $total += ($list['cost_price']*$list['trans_inventory']);
    $total_qty +=$list['trans_inventory'];
}

echo '</tbody>';
echo '<tfoot class="text-center">';
    echo '<tr>';
        echo '<td></td>';
        echo '<td></td>';
        echo '<th>Total</th>';
        echo '<th>'.number_format($total_qty).'</th>';
        echo '<td></td>';
        echo '<td></td>';
        echo '<td></td>';
        echo '<th>'.@$currency[0][symbol].number_format($total,2).'</th>';
    echo '</tr>';
echo '</tfoot>';
echo '</table>';

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
