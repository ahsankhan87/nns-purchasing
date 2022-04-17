
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('farm/C_inventory/create',$attributes);

?>

<div class="form-group">
  <label class="control-label col-sm-2" for="MOQ">QC Check:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="MOQ" name="moq" value="<?php echo set_value('moq') ?>" placeholder="QC Check" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Item:<span class="required">* </span></label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('item') ?>"/>-->
    <?php echo form_dropdown('item_id',$productsDDL,set_value('item_id'),'class="form-control select2me"'); ?>
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Batch">IBN:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="ibn" name="ibn" value="<?php echo set_value('ibn') ?>" placeholder="IBN" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="in">In Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="in_date" name="in_date" value="<?php echo date("Y-m-d"); ?>" placeholder="In date" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="in">IN:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="in" name="in_qty" value="<?php echo set_value('in_qty') ?>" step="0.000001" placeholder="IN" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="waste">Waste:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="waste" name="waste" value="<?php echo set_value('waste'); ?>" step="0.000001"  placeholder="Waste" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
    <select name="status" class="form-control">
        <option>Approved</option>
        <option>Reject</option>
        <option>Quarantine</option>
        
    </select>
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