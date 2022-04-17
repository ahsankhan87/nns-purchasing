
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('farm/C_harvest/edit',$attributes);

foreach($update_harvest as $row)
{
?>

<div class="form-group">
  <label class="control-label col-sm-2" for="Harvest">Harvest Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="Harvest" name="harvest_date" value="<?php echo $row['harvest_date']; ?>" placeholder="Harvest Date" />
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
  <label class="control-label col-sm-2" for="unpressed_biomass">Unpressed Biomass:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="unpressed_biomass" value="<?php echo $row['unpressed_biomass']; ?>"  step="0.000001" name="unpressed_biomass" placeholder="Unpressed Biomass" />
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="pressed_biomass">Pressed Biomass:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="pressed_biomass" value="<?php echo $row['pressed_biomass']; ?>"  step="0.000001" name="pressed_biomass" placeholder="Pressed Biomass" />
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Units">Units:</label>
  <div class="col-sm-10">
   <?php echo form_dropdown('unit_id',$unitsDDL,$row['unit_id'],'class="form-control select2me"'); ?>
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
    <select name="status" class="form-control">
        <option <?php echo ($row['status'] == 'Approved' ? 'selected=""' : ''); ?>>Approved</option>
        <option <?php echo ($row['status'] == 'Reject' ? 'selected=""' : ''); ?>>Reject</option>
        
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