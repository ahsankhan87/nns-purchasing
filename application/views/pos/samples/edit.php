
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('trans/C_samples/edit',$attributes);

foreach($update_sample as $row)
{
?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product Name:<span class="required">* </span></label>
  <div class="col-sm-10">
      <!--<?php echo form_dropdown('item_id',$productsDDL,$row['item_id'],'class="form-control select2me"'); ?>-->
    <input type="text" class="form-control" id="item" value="<?php echo $row['item']; ?>" name="item" placeholder="Product Name"/>
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="supplier">Supplier Name:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="supplier" name="supplier" value="<?php echo $row['supplier']; ?>" placeholder="Supplier" />
    <!--<?php echo form_dropdown('supplier_id',$supplierDDL,$row['supplier_id'],'class="form-control select2me"'); ?>-->
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="qty">Quantity:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="qty" name="qty" value="<?php echo $row['qty']; ?>" placeholder="Quantity" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Unit">Unit:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Unit" name="unit" value="<?php echo $row['unit']; ?>" placeholder="Unit" />-->
    <?php echo form_dropdown('unit_id',$unitsDDL,$row['unit_id'],'class="form-control select2me"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Price">Price:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Price" name="price" value="<?php echo $row['price']; ?>" placeholder="Price" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Currency">Currency:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Currency" name="currency" value="<?php echo $row['currency']; ?>" placeholder="Currency" />-->
    <select name='currency' class="form-control" >
          <option <?php echo ($row['currency'] == 'USD' ? 'selected=""' : ''); ?>>USD</option>
          <option <?php echo ($row['currency'] == 'Euro' ? 'selected=""' : ''); ?>>Euro</option>
          <option <?php echo ($row['currency'] == 'PHP' ? 'selected=""' : ''); ?>>PHP</option>
      </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Department">Department:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Department" name="department" value="<?php echo $row['department_id']; ?>" placeholder="Department" />-->
    <?php echo form_dropdown('department_id',$categoryDDL,$row['department_id'],'class="form-control select2me"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Payment">Payment Status:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Payment" name="payment_status" value="<?php echo $row['payment_status']; ?>" placeholder="Payment Status" />-->
    <select name='payment_status' class="form-control" >
          <option <?php echo ($row['payment_status'] == 'Paid' ? 'selected=""' : ''); ?>>Paid</option>
          <option <?php echo ($row['payment_status'] == 'Unpaid' ? 'selected=""' : ''); ?>>Unpaid</option>
          <option <?php echo ($row['payment_status'] == 'Free' ? 'selected=""' : ''); ?>>Free</option>
      </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Delivery">Delivery Status:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Delivery" name="delivery_status" value="<?php echo $row['delivery_status']; ?>" placeholder="Delivery Status" />-->
    <select name='delivery_status' class="form-control" >
          <option <?php echo ($row['delivery_status'] == 'Delivered' ? 'selected=""' : ''); ?>>Delivered</option>
          <option <?php echo ($row['delivery_status'] == 'Pending' ? 'selected=""' : ''); ?>>Pending</option>
      </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Delivery">Approval:</label>
  <div class="col-sm-10">
      <select name=approval class="form-control" >
          <option <?php echo ($row['approval'] == 'Approved' ? 'selected=""' : ''); ?>>Approved</option>
          <option <?php echo ($row['approval'] == 'Rejected' ? 'selected=""' : ''); ?>>Rejected</option>
          <option <?php echo ($row['approval'] == 'Pending' ? 'selected=""' : ''); ?>>Pending</option>
      </select>
    
  </div>
</div>

<?php 

echo form_hidden('id',$row['id']);

echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
echo '<div class="col-sm-10">';
echo form_submit('submit','Update Sample','class="btn btn-success"');
echo '</div></div>';
}
echo form_close();

?>
</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->