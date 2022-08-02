
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('farm/C_grinding/create',$attributes);

?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Harvest">Harvest Date:</label>
  <div class="col-sm-10">
    <?php $harvest_date = $this->M_harvest->get_harvest_date(); ?>
    <select name="harvest_date" class="form-control">
        
        <?php foreach($harvest_date as $values) 
            {
                echo "<option value=".$values["harvest_date"].">".date("m/d/Y",strtotime($values["harvest_date"]))."</option>";
            }
        ?>
    </select>
  </div>
</div>

<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="Harvest">Harvest Date:</label>-->
<!--  <div class="col-sm-10">-->
<!--    <input type="date" class="form-control" id="Harvest" name="harvest_date" placeholder="Harvest Date" />-->
<!--  </div>-->
<!--</div>-->

<div class="form-group">
  <label class="control-label col-sm-2" for="Grinding">Grinding Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="Grinding" name="grinding_date" value="<?php echo date("Y-m-d"); ?>" placeholder="Grinding Date" />
  </div>
</div>

<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="Name">Product:<span class="required">* </span></label>-->
<!--  <div class="col-sm-10">-->
    <!--<input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('item') ?>"/>-->
<!--    <?php echo form_dropdown('product_id',$productsDDL,set_value('product_id'),'class="form-control select2me"'); ?>-->
<!--  </div>-->
<!--</div>-->


<div class="form-group">
  <label class="control-label col-sm-2" for="Batch">Batch Code:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Batch" name="batch_code" placeholder="Batch Code" />
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
  <label class="control-label col-sm-2" for="Quantity">Quantity:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Quantity" name="qty" step="0.000001" placeholder="Quantity" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Units">Units:</label>
  <div class="col-sm-10">
   <?php echo form_dropdown('unit_id',$unitsDDL,set_value('unit_id'),'class="form-control select2me"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Delivery">Delivery:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Delivery" name="delivery_date" value=""  placeholder="Delivery" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Status">FSMS:</label>
  <div class="col-sm-10">
    <select name="fsms" class="form-control">
        <option>Pending</option>
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