
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('farm/C_feeding/create',$attributes);

?>

<div class="form-group">
  <label class="control-label col-sm-2" for="date">Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="date" name="date" value="<?php echo date('Y-m-d'); ?>" placeholder="Date" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Item:<span class="required">* </span></label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('item') ?>"/>-->
    <?php echo form_dropdown('item_id',$inventoryDDL,set_value('prod_product_id'),'class="form-control select2me" id="item_id"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="ibn_1">IBN 1:</label>
  <div class="col-sm-10">
    <!--<?php echo form_dropdown('ibn_1',$ibnDDL,set_value('ibn_1'),'class="form-control select2me"'); ?>-->
    <select name="ibn_1" class="form-control" id="ibn_1">
        
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="ibn_qty_1">IBN Quantity 1:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="ibn_qty_1" name="ibn_qty_1" step="0.000001" placeholder="IBN Quantity 1" />
    <div class="text-danger" id="qty_1"></div>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="ibn_2">IBN 2:</label>
  <div class="col-sm-10">
    <!--<?php echo form_dropdown('ibn_2',$ibnDDL,set_value('ibn_2'),'class="form-control select2me"'); ?>-->
    <select name="ibn_2" class="form-control" id="ibn_2">
        
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="ibn_qty_2">IBN Quantity 2:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="ibn_qty_2" name="ibn_qty_2" step="0.000001" placeholder="IBN Quantity 2" />
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="ibn_3">IBN 3:</label>
  <div class="col-sm-10">
    <!--<?php echo form_dropdown('ibn_3',$ibnDDL,set_value('ibn_3'),'class="form-control select2me"'); ?>-->
    <select name="ibn_3" class="form-control" id="ibn_3">
        
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="ibn_qty_3">IBN Quantity 3:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="ibn_qty_3" name="ibn_qty_3" step="0.000001" placeholder="IBN Quantity 3" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Pond">Pond No.:</label>
  <div class="col-sm-10">
    <select name="pond_no" class="form-control">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
        <option>10</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="unit_id">Unit:</label>
  <div class="col-sm-10">
    <?php echo form_dropdown('unit_id',$unitsDDL,set_value('unit_id'),'class="form-control select2me"'); ?>
  </div>
</div>

<?php

echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
echo '<div class="col-sm-10">';
echo form_submit('submit','Submit','class="btn btn-success" id="submit_btn"');
echo '</div></div>';

echo form_close();

?>
</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
<style>
    input.error {
    color: red;
}
</style>
<script>
$(document).ready(function(){

	//////////////////////
	//GET CONTACT PERSONS DROP DOWN LIST 
	$('#item_id').on('change',function(){
		let document_table = '';
		let item_id = $(this).val();
		let in_qty = 0;
		let out_qty = 0;
		let waste = 0;
		var balance = 0;
		
		$.ajax({
			url: site_url+"/farm/C_feeding/get_ibn_by_item_id/"+item_id,
			type: 'GET',
			dataType: 'json', // added data type
			success: function(data) 
			{
				console.log(data);
				
				let i =0;
				document_table += '<option value="">Select IBN</option>';
				$.each(data,function(index, value){
					
					document_table += '<option value="'+value.id+'">';
						document_table += value.ibn;
					document_table += '</option>';
					
				    in_qty = value.in_qty;
				    out_qty = value.out_qty;
				    waste = value.waste;
				    balance = parseFloat(in_qty)-parseFloat(out_qty)-parseFloat(waste);
				});
				$('#ibn_1').html(document_table);
				$('#ibn_2').html(document_table);
				$('#ibn_3').html(document_table);
        $('#qty_1').html("cannot use more than "+parseFloat(balance).toFixed(2));
			},
			error: function (xhr, ajaxOptions, thrownError) {
				console.log(xhr.status);
				console.log(thrownError);
    			}
    		});
    		
    		$('#ibn_qty_1').on('keyup',function(){
                console.log(in_qty);
                let ibn_qty_1 = $(this).val();
                
                if(ibn_qty_1 > balance)
                {
                    $(this).addClass("error");
                    $(':input[type="submit"]').prop('disabled', true);
                    alert("cannot use more than "+parseFloat(balance).toFixed(2));
                }
                else if(ibn_qty_1 <= balance)
                {
                    $(this).removeClass("error");
                    $(':input[type="submit"]').prop('disabled', false);
                }
                
            });
    	});
    	//////////////////
	
    
});
</script>