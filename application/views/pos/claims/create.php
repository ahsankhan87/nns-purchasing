
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('trans/C_claims/create',$attributes);

?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">PO #:<span class="required">* </span></label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="name" name="name" placeholder="Product" />-->
    <?php echo form_dropdown('receiving_id',$receivingsDDL,set_value('receiving_id'),'class="form-control select2me" required="" '); ?>
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
          <option>Submitted</option>
          <option>Pending</option>
          
      </select>
    
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
      <select name='status' class="form-control" >
          <option>Approved</option>
          <option>Pending</option>
          <option>Rejected</option>
      </select>
    
  </div>
</div>


<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="comments">Note:</label>-->
<!--  <div class="col-sm-10">-->
<!--     <textarea name="comments" class="form-control"></textarea>-->
<!--  </div>-->
<!--</div>-->

<?php 

echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
echo '<div class="col-sm-10">';
echo form_submit('submit','Save','class="btn btn-success"');
echo '</div></div>';

echo form_close();

?>
</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->