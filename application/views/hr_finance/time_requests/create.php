<div class="row">
  <div class="col-sm-12">

    <?php
    $attributes = array('class' => 'form-horizontal', 'role' => 'form', 'enctype' => "multipart/form-data");
    echo validation_errors();
    echo form_open('hr_finance/C_time_requests/create', $attributes);

    ?>

    <div class="form-group">
      <label class="control-label col-sm-2" for="date_issued">Date Issued:</label>
      <div class="col-sm-10">
        <input type="date" class="form-control" id="date_issued" name="date_issued" value="<?php echo date("Y-m-d"); ?>" placeholder="Date Issued" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="issued_by">Issued By:</label>
      <div class="col-sm-10">
        <!-- <input type="text" class="form-control" id="issued_by" name="issued_by" value="<?php echo set_value("issued_by"); ?>" placeholder="Issued By" /> -->
        <select name="issued_by" class="form-control">
          <option>Marbin</option>
          <option>Francis</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="Employee">Employee:<span class="required">* </span></label>
      <div class="col-sm-10">
        <!-- <input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo set_value('Employee') ?>"/> -->
        <?php echo form_dropdown('emp_id', $employeesDDL, set_value('emp_id'), 'class="form-control select2me"'); ?>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-sm-2" for="req_period_from">Request Period From:</label>
      <div class="col-sm-10">
        <input type="date" class="form-control" id="req_period_from" name="req_period_from" value="<?php echo set_value("req_period_from"); ?>" placeholder="Request Period From" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="req_period_to">Request Period To:</label>
      <div class="col-sm-10">
        <input type="date" class="form-control" id="req_period_to" name="req_period_to" value="<?php echo set_value("req_period_to"); ?>" placeholder="Request Period To" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="Type">Type:</label>
      <div class="col-sm-10">
        <select name="type" class="form-control">
          <option>OT</option>
          <option>Undertime</option>
          <option>Leave</option>
          <option>Absent</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="gm">Approved by GM:</label>
      <div class="col-sm-10">
        <select name="gm_approved" class="form-control">
          <option value="1">Yes</option>
          <option value="0">No</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="gm">Approved by OM:</label>
      <div class="col-sm-10">
        <select name="om_approved" class="form-control">
          <option value="1">Yes</option>
          <option value="0">No</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="dm">Approved by Dep Manager:</label>
      <div class="col-sm-10">
        <select name="dm_approved" class="form-control">
          <option value="1">Yes</option>
          <option value="0">No</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="gm">Noted by HR:</label>
      <div class="col-sm-10">
        <select name="hr_noted" class="form-control">
          <option value="1">Yes</option>
          <option value="0">No</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="gm">Noted by AC:</label>
      <div class="col-sm-10">
        <select name="ac_noted" class="form-control">
          <option value="1">Yes</option>
          <option value="0">No</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="gm">Note:</label>
      <div class="col-sm-10">
        <textarea name="note" id="" cols="10" rows="5" class="form-control"></textarea>
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