
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('farm/C_inventory/edit',$attributes);

foreach($update_inventory as $row)
{
?>


<div class="form-group">
  <label class="control-label col-sm-2" for="MOQ">QC Check:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" value="<?php echo $row['moq']; ?>" id="MOQ" name="moq" placeholder="QC Check" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product:<span class="required">* </span></label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('item') ?>"/>-->
    <?php echo form_dropdown('item_id',$productsDDL,$row['prod_product_id'],'class="form-control select2me"'); ?>
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Batch">IBN:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Batch" name="ibn" value="<?php echo $row['ibn']; ?>"  placeholder="IBN" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="in">In Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="in_date" name="in_date" value="<?php echo $row['in_date']; ?>"  placeholder="In date" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="in">IN:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="in" name="in_qty" value="<?php echo $row['in_qty']; ?>" step="0.000001"  placeholder="IN" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="waste">Waste:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="waste" name="waste" value="<?php echo $row['waste']; ?>" step="0.000001"  placeholder="Waste" />
  </div>
</div>

<?php 
echo '<div class="form-group"><label class="control-label col-sm-2" for="status">Status</label>';
echo '<div class="col-sm-10">';
$option = array('Approved'=>'Approved','Reject'=>'Reject','Quarantine'=>'Quarantine');
echo form_dropdown('status',$option,$row['status'],'class="form-control"') . '</div></div>';
 

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