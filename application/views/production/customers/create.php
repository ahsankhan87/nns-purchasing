
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('production/C_customers/create',$attributes);

?>
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Customer Name:<span class="required">* </span></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="name" name="name" placeholder="Customer Name" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Contact">Contact Person:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Contact" name="contact_person" placeholder="Contact Person" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="contact_number">Contact Number:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="contact_number" name="contact_number" placeholder=Contact Number" />
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