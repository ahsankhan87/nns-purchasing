
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('trans/C_sourcing/create',$attributes);

?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product:<span class="required">* </span></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="name" name="name" placeholder="Product" />
    <!--<?php echo form_dropdown('product_id',$productsDDL,set_value('product_id'),'class="form-control required="" select2me"'); ?>-->
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Department">Department:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Department" name="department" placeholder="Department" />-->
    <?php echo form_dropdown('department_id',$categoryDDL,set_value('department_id'),'class="form-control select2me"'); ?>

  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Urgency">Urgency:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Payment" name="payment_status" placeholder="Payment Status" />-->
      <select name='urgency' class="form-control" id="Urgency" >
          <option>Urgent</option>
          <option>For Development</option>
          <option>Price Comparison</option>
      </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Requested">Requested By:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Requested" name="requested_by" placeholder="Requested By" />
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Requested_date">Request Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="Requested_date" name="request_date" placeholder="Request Date" />
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Sourced">Sourced By:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Sourced" name="sourced_by" placeholder="Sourced By" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
      <select name='status' class="form-control" >
          <option>Approved</option>
          <option>On Process</option>
          <option>On Hold</option>
      </select>
    <!--<input type="text" class="form-control" id="Delivery" name="delivery_status"  placeholder="Delivery Status" />-->
  </div>
</div>

<?php 

echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
echo '<div class="col-sm-10">';
echo form_submit('submit','Submit Sourcing','class="btn btn-success"');
echo '</div></div>';

echo form_close();

?>
</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->