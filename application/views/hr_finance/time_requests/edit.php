
<div class="row">
    <div class="col-sm-12">
<?php 
$attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
echo validation_errors();
echo form_open('hr_finance/C_time_requests/edit',$attributes);

foreach($update_time_requests as $row)
{
?>

<div class="form-group">
 <label class="control-label col-sm-2" for="date_issued">Date Issued:</label>
 <div class="col-sm-10">
   <input type="date" class="form-control" id="date_issued" name="date_issued" value="<?php echo $row["date_issued"]; ?>"placeholder="Date Issued" />
 </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="issued_by">Issued By:</label>
  <div class="col-sm-10">
        <!-- <input type="text" class="form-control" id="issued_by" name="issued_by" value="<?php echo $row["issued_by"]; ?>" placeholder="Issued By" /> -->
        <select name="issued_by" class="form-control">
            <option <?php echo ($row["issued_by"] == "Francis" ? "selected" : ""); ?>>Francis</option>
            <option <?php echo ($row["issued_by"] == "HR" ? "selected" : ""); ?>>HR</option>
            <option <?php echo ($row["issued_by"] == "Marben" ? "selected" : ""); ?>>Marben</option>
            <option <?php echo ($row["issued_by"] == "Dennies" ? "selected" : ""); ?>>Dennies</option>
            <option <?php echo ($row["issued_by"] == "Jarred" ? "selected" : ""); ?>>Jarred</option>
        </select>
  </div>
</div>

<div class="form-group">
 <label class="control-label col-sm-2" for="Employee">Employee:<span class="required">* </span></label>
 <div class="col-sm-10">
    <!-- <input type="text" class="form-control" id="name" name="item" placeholder="Product" value="<?php echo $row['Employee'] ?>"/> -->
   <?php echo form_dropdown('emp_id',$employeesDDL,$row['emp_id'],'class="form-control select2me"'); ?>
 </div>
</div>


<div class="form-group">
 <label class="control-label col-sm-2" for="req_period_from">Request Period From:</label>
 <div class="col-sm-10">
   <input type="date" class="form-control" id="req_period_from" name="req_period_from" value="<?php echo $row["req_period_from"]; ?>" placeholder="Request Period From" />
 </div>
</div>

<div class="form-group">
 <label class="control-label col-sm-2" for="req_period_to">Request Period To:</label>
 <div class="col-sm-10">
   <input type="date" class="form-control" id="req_period_to" name="req_period_to" value="<?php echo $row["req_period_to"]; ?>" placeholder="Request Period To" />
 </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="Type">Type:</label>
  <div class="col-sm-10">
    <select name="type" class="form-control">
        <option <?php echo ($row["type"] == "OT" ? "selected" : ""); ?>>OT</option>
        <option <?php echo ($row["type"] == "Undertime" ? "selected" : ""); ?>>Undertime</option>
        <option <?php echo ($row["type"] == "Leave" ? "selected" : ""); ?>>Leave</option>
        <option <?php echo ($row["type"] == "Absent" ? "selected" : ""); ?>>Absent</option>
        <option <?php echo ($row["type"] == "Paternity Leave" ? "selected" : ""); ?>>Paternity Leave</option>
        <option <?php echo ($row["type"] == "Maternity Leave" ? "selected" : ""); ?>>Maternity Leave</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="gm">Approved by GM:</label>
  <div class="col-sm-10">
    <select name="gm_approved" class="form-control">
        <option value="1" <?php echo ($row["gm_approved"] == "1" ? "selected" : ""); ?>>Yes</option>
        <option value="0" <?php echo ($row["gm_approved"] == "0" ? "selected" : ""); ?>>No</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="gm">Approved by OM:</label>
  <div class="col-sm-10">
    <select name="om_approved" class="form-control">
        <option value="1" <?php echo ($row["om_approved"] == "1" ? "selected" : ""); ?>>Yes</option>
        <option value="0" <?php echo ($row["om_approved"] == "0" ? "selected" : ""); ?>>No</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="dm">Approved by Dep Manager:</label>
  <div class="col-sm-10">
    <select name="dm_approved" class="form-control">
        <option value="1" <?php echo ($row["dm_approved"] == "1" ? "selected" : ""); ?>>Yes</option>
        <option value="0" <?php echo ($row["dm_approved"] == "0" ? "selected" : ""); ?>>No</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="gm">Noted by HR:</label>
  <div class="col-sm-10">
    <select name="hr_noted" class="form-control">
        <option value="1" <?php echo ($row["hr_noted"] == "1" ? "selected" : ""); ?>>Yes</option>
        <option value="0" <?php echo ($row["hr_noted"] == "0" ? "selected" : ""); ?>>No</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="gm">Noted by AC:</label>
  <div class="col-sm-10">
    <select name="ac_noted" class="form-control">
        <option value="1" <?php echo ($row["ac_noted"] == "1" ? "selected" : ""); ?>>Yes</option>
        <option value="0" <?php echo ($row["ac_noted"] == "0" ? "selected" : ""); ?>>No</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-sm-2" for="gm">Note:</label>
  <div class="col-sm-10">
    <textarea name="note" id="" cols="10" rows="5" class="form-control"><?php echo $row["note"]; ?></textarea>
  </div>
</div>

<?php 
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