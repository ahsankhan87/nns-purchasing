
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('trans/C_claims/edit',$attributes);

foreach($update_claim as $row)
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
<!--    <?php echo form_dropdown('supplier_id',$supplierDDL,set_value('supplier_id'),'class="form-control select2me"'); ?>-->

<!--  </div>-->
<!--</div>-->

<div class="form-group">
  <label class="control-label col-sm-2" for="ncr">NCR:</label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="ncr" name="ncr" placeholder="NCR" />-->
      <select name='ncr' class="form-control" >
          <option <?php echo ($row['ncr'] == 'Submitted' ? 'selected=""' : ''); ?>>Submitted</option>
          <option <?php echo ($row['ncr'] == 'Pending' ? 'selected=""' : ''); ?>>Pending</option>
          
      </select>
    
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
      <select name='status' class="form-control" >
          <option <?php echo ($row['status'] == 'Approved' ? 'selected=""' : ''); ?>>Approved</option>
          <option <?php echo ($row['status'] == 'Pending' ? 'selected=""' : ''); ?>>Pending</option>
          <option <?php echo ($row['status'] == 'Rejected' ? 'selected=""' : ''); ?>>Rejected</option>
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