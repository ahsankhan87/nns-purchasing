
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('trans/C_logistics_fees/edit',$attributes);

foreach($update_logistics_fee as $row)
{
?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">PO #:<span class="required">* </span></label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="name" name="name" placeholder="Product" />-->
    <?php echo form_dropdown('receiving_id',$receivingsDDL,$row['receiving_id'],'class="form-control required="" select2me"'); ?>
  </div>
</div>

<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="Supplier">Supplier:</label>-->
<!--  <div class="col-sm-10">-->
    <!--<input type="text" class="form-control" id="Department" name="department" placeholder="Department" />-->
<!--    <?php echo form_dropdown('supplier_id',$supplierDDL,$row['supplier_id'],'class="form-control select2me"'); ?>-->

<!--  </div>-->
<!--</div>-->

<div class="form-group">
  <label class="control-label col-sm-2" for="Shipping">Shipping:</label>
  <div class="col-sm-10">
      <select name='shipping' class="form-control" >
          <option <?php echo ($row['shipping'] == 'Local' ? 'selected=""' : ''); ?>>Local</option>
          <option <?php echo ($row['shipping'] == 'Sea' ? 'selected=""' : ''); ?>>Sea</option>
          <option <?php echo ($row['shipping'] == 'Air' ? 'selected=""' : ''); ?>>Air</option>
      </select>
    
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="billing_company">Billing Company:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="billing_company" name="billing_company" value="<?php echo $row['billing_company'] ?>" placeholder="Billing Company" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Reference">Reference #:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Reference" name="reference_no" value="<?php echo $row['reference_no'] ?>" placeholder="Reference" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Total">Total:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Total" name="total" value="<?php echo $row['total'] ?>" placeholder="Total" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Payment Status:</label>
  <div class="col-sm-10">
      <select name='payment_status' class="form-control" >
          <option <?php echo ($row['payment_status'] == 'Paid' ? 'selected=""' : ''); ?>>Paid</option>
          <option <?php echo ($row['payment_status'] == 'Unpaid' ? 'selected=""' : ''); ?>>Unpaid</option>
          
      </select>
    
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Payment Date:</label>
  <div class="col-sm-10">
      <input type="date" name="payment_date" class="form-control"  value="<?php echo date('Y-m-d',strtotime($row['payment_date'])); ?>"/>
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