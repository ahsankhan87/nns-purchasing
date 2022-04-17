
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('rd/C_samples_schedule/create',$attributes);

?>

<div class="form-group">
  <label class="control-label col-sm-2" for="date_request">Date:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="date_request" name="date" placeholder="Date" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product:<span class="required">* </span></label>
  <div class="col-sm-10">
    <!--<input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('item') ?>"/>-->
    <?php echo form_dropdown('product_id',$productsDDL,set_value('product_id'),'class="form-control select2me"'); ?>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Quantity">Quantity:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Quantity" name="qty" placeholder="Quantity" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Requested">BMF:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Requested" name="bmf" placeholder="BMF" />
  </div>
</div>


<div class="form-group">
  <label class="control-label col-sm-2" for="Status">Status:</label>
  <div class="col-sm-10">
    <select name="status" class="form-control">
        <option>On Process</option>
        <option>Sorting</option>
        <option>Bottling</option>
        <option>Quarantine</option>
        <option>Finished</option>
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