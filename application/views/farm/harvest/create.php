
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('farm/C_harvest/create',$attributes);

?>

<div class="form-group">
  <label class="control-label col-sm-2" for="Harvest">Harvest Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="Harvest" name="harvest_date" value="<?php echo date("Y-m-d"); ?>"  placeholder="Harvest Date" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Pond">Pond No.:</label>
  <div class="col-sm-10">
    <select name="pond_no" class="form-control">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
        <option>10</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="unpressed_biomass">Unpressed Biomass:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="unpressed_biomass" name="unpressed_biomass" step="0.000001" placeholder="Unpressed Biomass" />
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="pressed_biomass">Pressed Biomass:</label>
  <div class="col-sm-10">
    <input type="number" class="form-control" id="pressed_biomass" name="pressed_biomass"  step="0.000001" placeholder="Pressed Biomass" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Units">Units:</label>
  <div class="col-sm-10">
   <?php echo form_dropdown('unit_id',$unitsDDL,set_value('unit_id'),'class="form-control select2me"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
    <select name="status" class="form-control">
        <option>Approved</option>
        <option>Reject</option>
        <!--<option>Quarantine</option>-->
        
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