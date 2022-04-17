
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('trans/C_samples/create',$attributes);

?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product:<span class="required">* </span></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('item') ?>"/>
    <!--<?php echo form_dropdown('item_id',$productsDDL,set_value('item_id'),'class="form-control select2me"'); ?>-->
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="supplier">Supplier:</label>
  <div class="col-sm-10">
    <!--<?php echo form_dropdown('supplier_id',$supplierDDL,set_value('supplier_id'),'class="form-control select2me"'); ?>-->
    <input type="text" class="form-control" id="supplier" name="supplier" value="<?php echo set_value('supplier') ?>" placeholder="Supplier" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="qty">Quantity:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="qty" name="qty" placeholder="Quantity" value="<?php echo set_value('qty') ?>" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Unit">Unit:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Unit" name="unit" placeholder="Unit" />-->
    <?php echo form_dropdown('unit_id',$unitsDDL,set_value('unit_id'),'class="form-control select2me"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Price">Price:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Price" name="price" placeholder="Price" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Currency">Currency:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Currency" name="currency" placeholder="Currency" />-->
    <select name='currency' class="form-control" >
          <option>USD</option>
          <option>Euro</option>
          <option>PHP</option>
      </select>
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
  <label class="control-label col-sm-2" for="Payment">Payment Status:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Payment" name="payment_status" placeholder="Payment Status" />-->
      <select name='payment_status' class="form-control" >
          <option>Paid</option>
          <option>Unpaid</option>
          <option>Free</option>
      </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Delivery">Delivery Status:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Delivery" name="delivery_status" placeholder="Delivery Status" />-->
      <select name='delivery_status' class="form-control" >
          <option>Delivered</option>
          <option>Pending</option>
      </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Delivery">Approval:</label>
  <div class="col-sm-10">
      <select name='approval' class="form-control" >
          <option>Approved</option>
          <option>Rejected</option>
          <option>Pending</option>
      </select>
    <!--<input type="text" class="form-control" id="Delivery" name="delivery_status"  placeholder="Delivery Status" />-->
  </div>
</div>

<?php 

echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
echo '<div class="col-sm-10">';
echo form_submit('submit','Submit Sample','class="btn btn-success"');
echo '</div></div>';

echo form_close();

?>
</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->