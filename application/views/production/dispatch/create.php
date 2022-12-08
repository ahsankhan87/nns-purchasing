<div class="row">
  <div class="col-sm-12">

    <?php
    $attributes = array('class' => 'form-horizontal', 'role' => 'form', 'enctype' => "multipart/form-data");
    echo validation_errors();
    echo form_open('production/C_dispatch/create', $attributes);

    ?>

    <div class="form-group">
      <label class="control-label col-sm-2" for="dispatch_date">Dispatch Date:</label>
      <div class="col-sm-10">
        <input type="date" class="form-control" id="dispatch_date" name="dispatch_date" value="<?php echo date("Y-m-d"); ?>" placeholder="Date" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="product_id">Product:<span class="required">* </span></label>
      <div class="col-sm-10">
        <!-- <input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('Employee') ?>"/> -->
        <?php echo form_dropdown('product_id', $productsDDL, set_value('product_id'), 'class="form-control select2me product_id"'); ?>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="content">Content:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="content" name="content" value="<?php echo set_value("content"); ?>" readonly placeholder="Content" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="custom_content">Custom Content:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="custom_content" name="custom_content" value="<?php echo set_value("custom_content"); ?>"  placeholder="Custom Content" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="quantity">Quantity:</label>
      <div class="col-sm-10">
        <input type="number" class="form-control" id="quantity" name="quantity" value="<?php echo set_value("quantity"); ?>"  placeholder="Quantity" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="Type">Type of Dispatch:</label>
      <div class="col-sm-10">
        <select name="type" class="form-control">
          <option>Sales</option>
          <option>Samples</option>
          <option>FDA</option>
          <option>Giveaway</option>
          <option>Personal</option>
          <option>Employees</option>
          <option>Humanitarian</option>
          <option>DLA</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="Logistics">Logistics:</label>
      <div class="col-sm-10">
        <select name="logistics" class="form-control">
          <option>Pick Up</option>
          <option>Courier</option>
          <option>Delivery</option>
          <option>Hand Carry</option>
        </select>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-sm-2" for="recipient">Recipient:</label>
      <div class="col-sm-10">
        <!-- <input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('Employee') ?>"/> -->
        <?php echo form_dropdown('recipient', $customersDDL, set_value('recipient'), 'class="form-control select2me"'); ?>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-sm-2" for="dm">Approved by:</label>
      <div class="col-sm-10">
        <select name="approved_by" class="form-control">
          <option>CEO</option>
          <option>GM</option>
          <option>OM</option>
        </select>
      </div>
    </div>

    <?php

    echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
    echo '<div class="col-sm-10">';
    echo form_submit('submit', 'Submit', 'class="btn btn-success"');
    echo '</div></div>';

    echo form_close();

    ?>
  </div>
  <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
<script>
   $(document).ready(function() {

      const site_url = '<?php echo site_url($langs); ?>/';
      const path = '<?php echo base_url(); ?>';
      const date = '<?php echo date("Y-m-d") ?>';

      ////// LOAD COST PRICE, UNIT PRICE, TAX WHEN PRODUCT DROPDOWN CHANGE
      $('.product_id').on('change', function(event) {
            // event.preventDefault();
            var productid = $(this).val();
            
            $.ajax({
                url: site_url + "production/C_products/productDDL/" + productid,
                type: 'GET',
                dataType: 'json', // added data type
                success: function(data) {

                  $('#content').val(data[0].content);
                    
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            });


        });

  });
</script>