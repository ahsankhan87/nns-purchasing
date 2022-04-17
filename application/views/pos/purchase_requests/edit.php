
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('trans/C_purchase_requests/edit',$attributes);

foreach($update_purchase_request as $row)
{
?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product Name:<span class="required">* </span></label>
  <div class="col-sm-10">
      <?php echo form_dropdown('item_id',$productsDDL,$row['item_id'],'class="form-control select2me"'); ?>
    <!--<input type="text" class="form-control" id="item" value="<?php echo $row['item']; ?>" name="item" placeholder="Product Name"/>-->
  </div>
</div>


<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="supplier">Supplier Name:</label>-->
<!--  <div class="col-sm-10">-->
<!--    <input type="text" class="form-control" id="supplier" name="supplier" value="<?php echo $row['supplier']; ?>" placeholder="Supplier" />-->
    <!--<?php echo form_dropdown('supplier_id',$supplierDDL,$row['supplier_id'],'class="form-control select2me"'); ?>-->
<!--  </div>-->
<!--</div>-->

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
  <label class="control-label col-sm-2" for="c_stock">Current Stock:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="c_stock" name="current_stock" value="<?php echo $row['current_stock']; ?>" placeholder="Current Stock" />
  </div>
</div>

<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="Department">Department:</label>-->
<!--  <div class="col-sm-10">-->
    <!--<input type="text" class="form-control" id="Department" name="department" value="<?php echo $row['department_id']; ?>" placeholder="Department" />-->
<!--    <?php echo form_dropdown('department_id',$categoryDDL,$row['department_id'],'class="form-control select2me"'); ?>-->
<!--  </div>-->
<!--</div>-->

<div class="form-group">
  <label class="control-label col-sm-2" for="Payment">Requirements:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="Payment" name="payment_status" value="<?php echo $row['payment_status']; ?>" placeholder="Payment Status" />-->
    <select name='requirements' class="form-control" >
          <option <?php echo ($row['requirements'] == 'Restock' ? 'selected=""' : ''); ?>>Restock</option>
          <option <?php echo ($row['requirements'] == 'Production' ? 'selected=""' : ''); ?>>Production</option>
          <option <?php echo ($row['requirements'] == 'R&D' ? 'selected=""' : ''); ?>>R&D</option>
      </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="created_by">Created By:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="created_by" name="created_by" value="<?php echo $row['created_by']; ?>" />
   
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="request_date">Request Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="request_date" name="request_date" value="<?php echo $row['request_date']; ?>" />
   
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
      <select name=status class="form-control" >
          <option <?php echo ($row['status'] == 'On Process' ? 'selected=""' : ''); ?>>On Process</option>
          <option <?php echo ($row['status'] == 'PO Made' ? 'selected=""' : ''); ?>>PO Made</option>
          <option <?php echo ($row['status'] == 'On Hold' ? 'selected=""' : ''); ?>>On Hold</option>
      </select>
    
  </div>
</div>

<?php 

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