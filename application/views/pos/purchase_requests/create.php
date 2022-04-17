
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('trans/C_purchase_requests/create',$attributes);

?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product:<span class="required">* </span></label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('item') ?>"/>-->
    <?php echo form_dropdown('item_id',$productsDDL,set_value('item_id'),'class="form-control select2me"'); ?>
  </div>
</div>

<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="supplier">Supplier:</label>-->
<!--  <div class="col-sm-10">-->
    <!--<?php echo form_dropdown('supplier_id',$supplierDDL,set_value('supplier_id'),'class="form-control select2me"'); ?>-->
<!--    <input type="text" class="form-control" id="supplier" name="supplier" value="<?php echo set_value('supplier') ?>" placeholder="Supplier" />-->
<!--  </div>-->
<!--</div>-->

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
  <label class="control-label col-sm-2" for="c_stock">Current Stock:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="c_stock" name="current_stock" value="<?php echo $row['current_stock']; ?>" placeholder="Current Stock" />
  </div>
</div>

<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="Department">Department:</label>-->
<!--  <div class="col-sm-10">-->
    <!--<input type="text" class="form-control" id="Department" name="department" placeholder="Department" />-->
<!--    <?php echo form_dropdown('department_id',$categoryDDL,set_value('department_id'),'class="form-control select2me"'); ?>-->

<!--  </div>-->
<!--</div>-->

<div class="form-group">
  <label class="control-label col-sm-2" for="Payment">Requirments:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Payment" name="payment_status" placeholder="Payment Status" />-->
      <select name='requirements' class="form-control" >
          <option>Restock</option>
          <option>Production</option>
          <option>R&D</option>
      </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="created_by">Created By:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="created_by" name="created_by" value="<?php echo set_value('created_by') ?>" placeholder="Created By" />
   
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="request_date">Request Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="request_date" name="request_date" value="<?php echo date('Y-m-d');?>" placeholder="Request Date" />
    
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
      <select name='status' class="form-control" >
          <option>On Process</option>
          <option>PO Made</option>
          <option>On Hold</option>
      </select>
    <!--<input type="text" class="form-control" id="Delivery" name="delivery_status"  placeholder="Delivery Status" />-->
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