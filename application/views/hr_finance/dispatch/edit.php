<div class="row">
  <div class="col-sm-12">
    <?php
    $attributes = array('class' => 'form-horizontal', 'role' => 'form', 'enctype' => "multipart/form-data");
    echo validation_errors();
    echo form_open('hr_finance/C_dispatch/edit', $attributes);

    foreach ($update_dispatch as $row) {
    ?>

      <div class="form-group">
        <label class="control-label col-sm-2" for="dispatch_date">Dispatch Date:</label>
        <div class="col-sm-10">
          <input type="date" class="form-control" id="dispatch_date" name="dispatch_date" value="<?php echo $row["dispatch_date"]; ?>" placeholder="Date" />
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-2" for="product_id">Product:<span class="required">* </span></label>
        <div class="col-sm-10">
          <!-- <input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo $row['Employee'] ?>"/> -->
          <?php echo form_dropdown('product_id', $productsDDL, $row['product_id'], 'class="form-control select2me"'); ?>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-2" for="content">Content:</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="content" name="content" value="<?php echo $row["content"]; ?>" readonly placeholder="Content" />
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-2" for="custom_content">Custom Content:</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="custom_content" name="custom_content" value="<?php echo $row["custom_content"]; ?>"  placeholder="Custom Content" />
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-2" for="quantity">Quantity:</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="quantity" name="quantity" value="<?php echo round($row["quantity"]); ?>"  placeholder="Quantity" />
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-2" for="Type">Type of Dispatch:</label>
        <div class="col-sm-10">
          <select name="type" class="form-control">
            <option <?php echo ($row["type"] == "Sales" ? "selected" : ""); ?>>Sales</option>
            <option <?php echo ($row["type"] == "Samples" ? "selected" : ""); ?>>Samples</option>
            <option <?php echo ($row["type"] == "FDA" ? "selected" : ""); ?>>FDA</option>
            <option <?php echo ($row["type"] == "Giveaway" ? "selected" : ""); ?>>Giveaway</option>
            <option <?php echo ($row["type"] == "Personal" ? "selected" : ""); ?>>Personal</option>
            <option <?php echo ($row["type"] == "Employees" ? "selected" : ""); ?>>Employees</option>
            <option <?php echo ($row["type"] == "Humanitarian" ? "selected" : ""); ?>>Humanitarian</option>
            <option <?php echo ($row["type"] == "DLA" ? "selected" : ""); ?>>DLA</option>
          </select>
        </div>
      </div>

      <div class="form-group">
        <label class="control-label col-sm-2" for="Logistics">Logistics:</label>
        <div class="col-sm-10">
          <select name="logistics" class="form-control">
            <option <?php echo ($row["logistics"] == "Pick Up" ? "selected" : ""); ?>>Pick Up</option>
            <option <?php echo ($row["logistics"] == "Courier" ? "selected" : ""); ?>>Courier</option>
            <option <?php echo ($row["logistics"] == "Delivery" ? "selected" : ""); ?>>Delivery</option>
            <option <?php echo ($row["logistics"] == "Hand Carry" ? "selected" : ""); ?>>Hand Carry</option>
          </select>
        </div>
      </div>


      <div class="form-group">
        <label class="control-label col-sm-2" for="recipient">Recipient:</label>
        <div class="col-sm-10">
          <?php echo form_dropdown('recipient', $customersDDL, $row['customer_id'], 'class="form-control select2me"'); ?>
        </div>
      </div>


      <div class="form-group">
        <label class="control-label col-sm-2" for="dm">Approved by:</label>
        <div class="col-sm-10">
          <select name="approved_by" class="form-control">
            <option <?php echo ($row["approved_by"] == "CEO" ? "selected" : ""); ?>>CEO</option>
            <option <?php echo ($row["approved_by"] == "GM" ? "selected" : ""); ?>>GM</option>
            <option <?php echo ($row["approved_by"] == "OM" ? "selected" : ""); ?>>OM</option>
          </select>
        </div>
      </div>

    <?php
      echo form_hidden('id', $row['id']);

      echo '<div class="form-group"><label class="control-label col-sm-2" for="submit"></label>';
      echo '<div class="col-sm-10">';
      echo form_submit('submit', 'Update', 'class="btn btn-success"');
      echo '</div></div>';
    }
    echo form_close();

    ?>
  </div>
  <!-- /.col-sm-12 -->
</div>
<!-- /.row -->