
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('rd/C_rd_history/edit',$attributes);

foreach($update_samples_request as $row)
{
?>

<div class="form-group">
  <label class="control-label col-sm-2" for="date_request">Date Request:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="date_request" value="<?php echo $row['date_request']; ?>" name="date_request" placeholder="Date Request" />
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
  <label class="control-label col-sm-2" for="Urgency">Urgency:</label>
  <div class="col-sm-10">
    <select name="urgency" class="form-control">
        <option <?php echo ($row['urgency'] == 'R&D' ? 'selected=""' : ''); ?>>R&D</option>
        <option <?php echo ($row['urgency'] == 'Regulatory' ? 'selected=""' : ''); ?>>Regulatory</option>
        <option <?php echo ($row['urgency'] == 'Samples' ? 'selected=""' : ''); ?>>Samples</option>
        <option <?php echo ($row['urgency'] == 'Humanitarian' ? 'selected=""' : ''); ?>>Humanitarian</option>
        <option <?php echo ($row['urgency'] == 'Giveaway' ? 'selected=""' : ''); ?>>Giveaway</option>
        <option <?php echo ($row['urgency'] == 'Others' ? 'selected=""' : ''); ?>>Others</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Requested">Requested By:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Requested" name="requested_by" value="<?php echo $row['requested_by']; ?>" placeholder="Requested By" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Customer">Customer:</label>
  <div class="col-sm-10">
      <input type="text" class="form-control" id="customer_id" name="customer_id" placeholder="Customer" value="<?php echo $row['customer_id'] ?>"/>
   <!--<?php echo form_dropdown('customer_id',$customersDDL,$row['customer_id'],'class="form-control select2me"'); ?>-->
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
    <select name="status" class="form-control">
        <option <?php echo ($row['status'] == 'Pending' ? 'selected=""' : ''); ?>>Pending</option>
        <option <?php echo ($row['status'] == 'On Process' ? 'selected=""' : ''); ?>>On Process</option>
        <option <?php echo ($row['status'] == 'Labeling' ? 'selected=""' : ''); ?>>Labeling</option>
        <option <?php echo ($row['status'] == 'Finished' ? 'selected=""' : ''); ?>>Finished</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Delivery">Delivery:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="Delivery" name="delivery_date" value="<?php echo $row['delivery_date']; ?>" placeholder="Delivery" />
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