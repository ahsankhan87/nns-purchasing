
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('trans/C_sourcing/edit',$attributes);

foreach($update_sourcing as $row)
{
?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product Name:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="name" value="<?php echo $row['product']; ?>" name="name" placeholder="Product Name"/>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Department">Department:<span class="required">* </span></label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Department" name="department" value="<?php echo $row['department']; ?>" placeholder="Department" />-->
    <?php echo form_dropdown('department_id',$categoryDDL,$row['department_id'],'class="form-control select2me"'); ?>

  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Urgency">Urgency:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Payment" name="payment_status" placeholder="Payment Status" />-->
      <select name='urgency' class="form-control" id="Urgency" >
          <option <?php echo ($row['urgency'] == 'Urgent' ? 'selected=""' : ''); ?>>Urgent</option>
          <option <?php echo ($row['urgency'] == 'For Development' ? 'selected=""' : ''); ?>>For Development</option>
          <option <?php echo ($row['urgency'] == 'Price Comparison' ? 'selected=""' : ''); ?>>Price Comparison</option>
          
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
  <label class="control-label col-sm-2" for="Requested_date">Request Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" name="request_date" value="<?php echo date('Y-m-d',strtotime($row['request_date'])); ?>" />
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Sourced">Sourced By:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Sourced" name="sourced_by"  value="<?php echo $row['sourced_by']; ?>" placeholder="Sourced By" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
      <select name='status' class="form-control" >
          <option <?php echo ($row['status'] == 'Approved' ? 'selected=""' : ''); ?>>Approved</option>
          <option <?php echo ($row['status'] == 'On Process' ? 'selected=""' : ''); ?>>On Process</option>
          <option <?php echo ($row['status'] == 'On Hold' ? 'selected=""' : ''); ?>>On Hold</option>
          
      </select>
    <!--<input type="text" class="form-control" id="Delivery" name="delivery_status"  placeholder="Delivery Status" />-->
  </div>
</div>

<?php 

echo form_hidden('id',$row['id']);

echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
echo '<div class="col-sm-10">';
echo form_submit('submit','Update Sourcing','class="btn btn-success"');
echo '</div></div>';
}
echo form_close();

?>
</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->