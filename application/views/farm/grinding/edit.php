
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('farm/C_grinding/edit',$attributes);

foreach($update_grinding as $row)
{
?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Harvest">Harvest Date:</label>
  <div class="col-sm-10">
    <?php $harvest_date = $this->M_harvest->get_harvest_date(); ?>
    <select name="harvest_date" class="form-control">
        
        <?php foreach($harvest_date as $values) 
            {
                echo "<option value=".$values["harvest_date"]." ".($row['harvest_date'] == $values["harvest_date"] ? 'selected' : '').">".date("m/d/Y",strtotime($values["harvest_date"]))."</option>";
            }
        ?>
    </select>
  </div>
</div>

<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="Harvest">Harvest Date:</label>-->
<!--  <div class="col-sm-10">-->
<!--    <input type="date" class="form-control" id="Harvest" name="harvest_date" value="<?php echo $row['harvest_date']; ?>" placeholder="Harvest Date" />-->
<!--  </div>-->
<!--</div>-->

<div class="form-group">
  <label class="control-label col-sm-2" for="Grinding">Grinding Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="Grinding" name="grinding_date" value="<?php echo $row['grinding_date']; ?>" placeholder="Grinding Date" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Batch">Batch Code:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Batch" name="batch_code" value="<?php echo $row['batch_code']; ?>" placeholder="Batch Code" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Pond">Pond No.:</label>
  <div class="col-sm-10">
    <select name="pond_no" class="form-control">
        <option <?php echo ($row['pond_no'] == '1' ? 'selected=""' : ''); ?>>1</option>
        <option <?php echo ($row['pond_no'] == '2' ? 'selected=""' : ''); ?>>2</option>
        <option <?php echo ($row['pond_no'] == '3' ? 'selected=""' : ''); ?>>3</option>
        <option <?php echo ($row['pond_no'] == '4' ? 'selected=""' : ''); ?>>4</option>
        <option <?php echo ($row['pond_no'] == '5' ? 'selected=""' : ''); ?>>5</option>
        <option <?php echo ($row['pond_no'] == '6' ? 'selected=""' : ''); ?>>6</option>
        <option <?php echo ($row['pond_no'] == '7' ? 'selected=""' : ''); ?>>7</option>
        <option <?php echo ($row['pond_no'] == '8' ? 'selected=""' : ''); ?>>8</option>
        <option <?php echo ($row['pond_no'] == '9' ? 'selected=""' : ''); ?>>9</option>
        <option <?php echo ($row['pond_no'] == '10' ? 'selected=""' : ''); ?>>10</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Quantity">Quantity:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Quantity" name="qty" step="0.000001" value="<?php echo $row['qty']; ?>" placeholder="Quantity" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Units">Units:</label>
  <div class="col-sm-10">
   <?php echo form_dropdown('unit_id',$unitsDDL,$row['unit_id'],'class="form-control select2me"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Delivery">Delivery:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="Delivery" name="delivery_date" value="<?php echo $row['delivery_date']; ?>" placeholder="Delivery" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">FSMS:</label>
  <div class="col-sm-10">
    <select name="fsms" class="form-control">
        <option <?php echo ($row['fsms'] == 'Pending' ? 'selected=""' : ''); ?>>Pending</option>
        <option <?php echo ($row['fsms'] == 'Approved' ? 'selected=""' : ''); ?>>Approved</option>
        <option <?php echo ($row['fsms'] == 'Reject' ? 'selected=""' : ''); ?>>Reject</option>
        <option <?php echo ($row['fsms'] == 'Quarantine' ? 'selected=""' : ''); ?>>Quarantine</option>
        
    </select>
  </div>
</div>

<?php 
//echo '<div class="form-group"><label class="control-label col-sm-2" for="status">Status</label>';
//echo '<div class="col-sm-10">';
//$option = array('active'=>'active','inactive'=>'inactive');
//echo form_dropdown('status',$option,$row['status'],'class="form-control"') . '</div></div>';
 

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