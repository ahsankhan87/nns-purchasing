
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('rd/C_samples_request/create',$attributes);

?>

<div class="form-group">
  <label class="control-label col-sm-2" for="date_request">Date Request:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="date_request" name="date_request" placeholder="Date Request" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product:<span class="required">* </span></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="product_id" name="product_id" placeholder="Product" value="<?php echo set_value('product_id') ?>"/>
    <!--<?php echo form_dropdown('product_id',$productsDDL,set_value('product_id'),'class="form-control select2me"'); ?>-->
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Quantity">Quantity:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Quantity" name="qty" placeholder="Quantity" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Urgency">Urgency:</label>
  <div class="col-sm-10">
    <select name="urgency" class="form-control">
        <option>R&D</option>
        <option>Regulatory</option>
        <option>Samples</option>
        <option>Humanitarian</option>
        <option>Giveaway</option>
        <option>Others</option>
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
  <label class="control-label col-sm-2" for="Customer">Customer:</label>
  <div class="col-sm-10">
      <input type="text" class="form-control" id="customer_id" name="customer_id" placeholder="Customer" value="<?php echo set_value('customer_id') ?>"/>
   <!--<?php echo form_dropdown('customer_id',$customersDDL,set_value('customer_id'),'class="form-control select2me"'); ?>-->
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
    <select name="status" class="form-control">
        <option>Pending</option>
        <option>On Process</option>
        <option>Labeling</option>
        <option>Finished</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Delivery">Delivery:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="Delivery" name="delivery_date" placeholder="Delivery" />
  </div>
</div>

<?php

echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
echo '<div class="col-sm-10">';
echo form_submit('submit','Submit','class="btn btn-success"');
echo '</div></div>';

echo form_close();

?>
</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->