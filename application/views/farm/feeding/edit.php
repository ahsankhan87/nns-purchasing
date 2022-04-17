
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('farm/C_feeding/edit',$attributes);

foreach($update_feeding as $row)
{
?>

<div class="form-group">
  <label class="control-label col-sm-2" for="date">Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="date"  value="<?php echo $row['date']; ?>" name="date" placeholder="Date" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Item:<span class="required">* </span></label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('item') ?>"/>-->
    <?php echo form_dropdown('item_id',$inventoryDDL,$row['item_id'],'class="form-control select2me" id="item_id"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="ibn_1">IBN 1:</label>
  <div class="col-sm-10">
    <?php echo form_dropdown('ibn_1',$ibnDDL,$row['ibn_1'],'class="form-control select2me" id="ibn_1"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="in1">IBN Quantity 1:</label>
  <div class="col-sm-10">
      <input type="hidden" name='old_ibn_qty_1' value="<?php echo $row['ibn_qty_1']; ?>" />
    <input type="number" class="form-control" id="in1" value="<?php echo $row['ibn_qty_1']; ?>" step="0.000001"  name="ibn_qty_1" placeholder="IBN Quantity 1" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="ibn_2">IBN 2:</label>
  <div class="col-sm-10">
    <?php echo form_dropdown('ibn_2',$ibnDDL,$row['ibn_2'],'class="form-control select2me" id="ibn_2"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="in21">IBN Quantity 2:</label>
  <div class="col-sm-10">
      <input type="hidden" name='old_ibn_qty_2' value="<?php echo $row['ibn_qty_2']; ?>" />
    <input type="number" class="form-control" value="<?php echo $row['ibn_qty_2']; ?>" step="0.000001" name="ibn_qty_2" placeholder="IBN Quantity 1" />
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="ibn_3">IBN 3:</label>
  <div class="col-sm-10">
    <?php echo form_dropdown('ibn_3',$ibnDDL,$row['ibn_3'],'class="form-control select2me" id="ibn_3"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="in31">IBN Quantity 3:</label>
  <div class="col-sm-10">
      <input type="hidden" name='old_ibn_qty_3' value="<?php echo $row['ibn_qty_3']; ?>" />
    <input type="number" class="form-control" value="<?php  echo $row['ibn_qty_3']; ?>" step="0.000001" name="ibn_qty_3" placeholder="IBN Quantity 1" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Pond">Pond No.:</label>
  <div class="col-sm-10">
    <select name="pond_no" class="form-control">
        <option <?php echo ($row['pond_no'] == '1' ? 'selected=""' : ''); ?>>1</option>
        <option <?php echo ($row['pond_no'] == '2' ? 'selected=""' : ''); ?>>2</option>
        <option <?php echo ($row['pond_no'] == '3' ? 'selected=""' : ''); ?>>3</option>
        <option <?php echo ($row['pond_no'] == '4' ? 'selected=""' : ''); ?>>4</option>
        <option <?php echo ($row['pond_no'] == '5' ? 'selected=""' : ''); ?>>5</option>
        <option <?php echo ($row['pond_no'] == '6' ? 'selected=""' : ''); ?>>6</option>
        <option <?php echo ($row['pond_no'] == '7' ? 'selected=""' : ''); ?>>7</option>
        <option <?php echo ($row['pond_no'] == '8' ? 'selected=""' : ''); ?>>8</option>
        <option <?php echo ($row['pond_no'] == '9' ? 'selected=""' : ''); ?>>9</option>
        <option <?php echo ($row['pond_no'] == '10' ? 'selected=""' : ''); ?>>10</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="unit_id">Unit:</label>
  <div class="col-sm-10">
    <?php echo form_dropdown('unit_id',$unitsDDL,$row['unit_id'],'class="form-control select2me"'); ?>
  </div>
</div>


<?php 
//echo '<div class="form-group"><label class="control-label col-sm-2" for="status">Status</label>';
//echo '<div class="col-sm-10">';
//$option = array('active'=>'active','inactive'=>'inactive');
//echo form_dropdown('status',$option,$row['status'],'class="form-control"') . '</div></div>';
 

echo form_hidden('id',$row['id']);

echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
echo '<div class="col-sm-10">';
echo form_submit('submit','Update','class="btn btn-success"');
echo '</div></div>';
}
echo form_close();

?>
</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->

<script>
$(document).ready(function(){

	//////////////////////
	//GET CONTACT PERSONS DROP DWON LIST 
	$('#item_id').on('change',function(){
		let document_table = '';
		let item_id = $(this).val();
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
				
				});
				$('#ibn_1').html(document_table);
				$('#ibn_2').html(document_table);
				$('#ibn_3').html(document_table);

			},
			error: function (xhr, ajaxOptions, thrownError) {
				console.log(xhr.status);
				console.log(thrownError);
			}
		});
	});
	//////////////////

});
</script>