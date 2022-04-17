
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('production/C_production_request/create',$attributes);

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
    <!--<input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('item') ?>"/>-->
    <?php echo form_dropdown('product_id',$productsDDL,set_value('product_id'),'class="form-control select2me"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Quantity">Quantity:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Quantity" name="qty" placeholder="Quantity" />
  </div>
</div>

<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="Urgency">Urgency:</label>-->
<!--  <div class="col-sm-10">-->
<!--    <select name="urgency" class="form-control">-->
<!--        <option>Buffer</option>-->
<!--        <option>Order</option>-->
        
<!--    </select>-->
<!--  </div>-->
<!--</div>-->

<div class="form-group">
  <label class="control-label col-sm-2" for="Requested">Requested By:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Requested" name="requested_by" placeholder="Requested By" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Customer">Customer:</label>
  <div class="col-sm-10">
   <?php echo form_dropdown('customer_id',$customersDDL,set_value('customer_id'),'class="form-control select2me"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="bmf">BMF:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="bmf" name="bmf" placeholder="BMF" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
    <select name="status" class="form-control">
        <option >Scheduled</option>
        <option >On Process</option>
        <option >Sorting</option>
        <option >Bottling</option>
        <option >Quarantine</option>
        <option >Finished</option>
    </select>
  </div>
</div>


<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="Status">Status:</label>-->
<!--  <div class="col-sm-10">-->
<!--    <select name="status" class="form-control">-->
<!--        <option>Pending</option>-->
<!--        <option>On Process</option>-->
<!--        <option>Labeling</option>-->
<!--        <option>Finished</option>-->
<!--    </select>-->
<!--  </div>-->
<!--</div>-->

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