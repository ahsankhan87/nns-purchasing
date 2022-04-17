
<div class="row">
    <div class="col-sm-12">
   
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('production/C_products/create',$attributes);

?>
<!--<div class="form-group">-->
<!--  <label class="control-label col-sm-2" for="Brand">Brand Name:</label>-->
<!--  <div class="col-sm-10">-->
<!--    <input type="text" class="form-control" id="Brand" name="brand" value="<?php echo set_value('brand'); ?>" placeholder="Brand Name" />-->
<!--  </div>-->
<!--</div>-->
<div class="form-group">
  <label class="control-label col-sm-2" for="Name">Product/Brand Name:<span class="required">* </span></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="name" name="name" value="<?php echo set_value('name'); ?>" placeholder="Product Name" />
  </div>
</div>
<div class="form-group">
  <label class="control-label col-sm-2" for="item_number">Item Number:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="item_number" name="item_number" value="<?php echo set_value('item_number'); ?>" placeholder="Item Number" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Content">Content:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Content" name="content" value="<?php echo set_value('content'); ?>" placeholder="Content" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Packaging">Packaging:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="Packaging" name="packaging" value="<?php echo set_value('packaging'); ?>"  placeholder="Packaging" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="current_stock">On Stock:</label>
  <div class="col-sm-10">
    <input type="text" class="form-control" id="current_stock" name="current_stock" value="<?php echo set_value('current_stock'); ?>" placeholder="On Stock" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="fda_validity">FDA Validity:</label>
  <div class="col-sm-10">
    <input type="date" class="form-control" id="fda_validity" name="fda_validity" value="<?php echo set_value('fda_validity'); ?>" placeholder="FDA Validity" />
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