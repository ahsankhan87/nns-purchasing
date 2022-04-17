
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('rd/C_samples_schedule/edit',$attributes);

foreach($update_samples_schedule as $row)
{
?>

<div class="form-group">
  <label class="control-label col-sm-2" for="date_request">Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="date_request" value="<?php echo $row['date']; ?>" name="date" placeholder="Date" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product:<span class="required">* </span></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="product_id" name="product_id" placeholder="Product" value="<?php echo $row['product_id'] ?>"/>
    <!--<?php echo form_dropdown('product_id',$productsDDL,$row['product_id'],'class="form-control select2me"'); ?>-->
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Quantity">Quantity:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Quantity" name="qty" value="<?php echo $row['qty']; ?>" placeholder="Quantity" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="bmf">BMF:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="bmf" name="bmf" value="<?php echo $row['bmf']; ?>" placeholder="BMF" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
    <select name="status" class="form-control">
        <option <?php echo ($row['status'] == 'On Process' ? 'selected=""' : ''); ?>>On Process</option>
        <option <?php echo ($row['status'] == 'Sorting' ? 'selected=""' : ''); ?>>Sorting</option>
        <option <?php echo ($row['status'] == 'Bottling' ? 'selected=""' : ''); ?>>Bottling</option>
        <option <?php echo ($row['status'] == 'Quarantine' ? 'selected=""' : ''); ?>>Quarantine</option>
        <option <?php echo ($row['status'] == 'Finished' ? 'selected=""' : ''); ?>>Finished</option>
    </select>
  </div>
</div>

<?php 
//echo '<div class="form-group"><label class="control-label col-sm-2" for="status">Status</label>';
//echo '<div class="col-sm-10">';
//$option = array('active'=>'active','inactive'=>'inactive');
//echo form_dropdown('status',$option,$row['status'],'class="form-control"') . '</div></div>';
 

echo form_hidden('id',$row['id']);
echo form_hidden('customer_id',$row['customer_id']);
echo form_hidden('delivery_date',$row['delivery_date']);
echo form_hidden('urgency',$row['urgency']);
echo form_hidden('requested_by',$row['requested_by']);

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