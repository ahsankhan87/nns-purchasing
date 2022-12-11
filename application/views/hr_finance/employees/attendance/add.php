<?php
if ($this->session->flashdata('message')) {
    echo "<div class='alert alert-success fade in'>";
    echo '<span>' . $this->session->flashdata('message') . '</span>';
    echo '</div>';
}
if ($this->session->flashdata('error')) {
    echo "<div class='alert alert-danger fade in'>";
    echo '<span>' . $this->session->flashdata('error') . '</span>';
    echo "</div>";
}
?>
 
<div class='row'>

	<div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
    
    <form method="post" action="<?php echo site_url('hr_finance/C_employees_attendance/add'); ?>">
	
        <div class="form-group">
                <label class="control-label col-sm-2" for="">Date</label>
                 <div class="col-sm-4">
                    <input type="date" value="<?php echo date('Y-m-d'); ?>" name="dated" class="form-control" />
                 </div> 
            </div>
            
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
                    <!-- <th>Id</th> -->
					<th>Employees</th>
                    <th>Time In</th>
                    <th>Time Out</th>
                    <th>Full Day</th>
                    <th>Overtime</th>
                    <th>Weekend</th>
                    <th>Holiday</th>
                    <th>Quarantine</th>
                    <th>Undertime</th>
                    <th>Late</th>
                    <th>Absent</th>
                    <th>Leave</th>
				</tr>
			</thead>
			<tbody>
            <?php foreach($employees as $values): ?>
             <tr >
                
                <input type="hidden" name="employee_id[]" value="<?php echo $values['id']; ?>"  />           
                
                <!-- <td><?php echo $values['id']; ?></td> -->
                <td><input type="text" value="<?php echo $values['first_name']; ?>" class="form-control" readonly="" /></td>
                <td><input type="time" name="time_in[]" id="<?php echo 'time_in_'.$values['id']; ?>" min="<?php echo $values['working_hour_from']; ?>" max="<?php echo $values['working_hour_to']; ?>" value="<?php echo $values['working_hour_from']; ?>" class="form-control time_in" /></td>
                <td><input type="time" name="time_out[]" id="<?php echo 'time_out_'.$values['id']; ?>" min="<?php echo $values['working_hour_from']; ?>" max="<?php echo $values['working_hour_to']; ?>" value="<?php echo $values['working_hour_to']; ?>" class="form-control time_out" /></td>
                
                <td><select name="full_day[]" class="form-control full_day" id="<?php echo 'fullday_'.$values['id']; ?>">
                    <option value="0">No</option>
                    <option value="1">Yes</option>
                    
                    </select>
                </td>
                
                <td><select name="overtime[]" class="form-control" id="<?php echo 'overtime_'.$values['id']; ?>">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="weekend[]" class="form-control" id="<?php echo 'weekend_'.$values['id']; ?>">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="holiday[]" class="form-control" id="<?php echo 'holiday_'.$values['id']; ?>">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="quarantine[]" class="form-control" id="<?php echo 'quarantine_'.$values['id']; ?>">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="undertime[]" class="form-control" id="<?php echo 'undertime_'.$values['id']; ?>">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="late[]" class="form-control" id="<?php echo 'late_'.$values['id']; ?>">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="absent[]" class="form-control absent" id="<?php echo 'absent_'.$values['id']; ?>">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="leave[]" class="form-control leave" id="<?php echo 'leave_'.$values['id']; ?>">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
            </tr>
           <?php endforeach; ?>
              <tr>
                <td colspan="12"><button type="submit" class="btn btn-success pull-right" onclick="return(confirm('Are you sure! you want to save.'))" >Save</button></td>
              </tr>  
               
			</tbody>
		</table>
         </form>
	</div>
</div>
  
<script>
   $(document).ready(function() {

      const site_url = '<?php echo site_url($langs); ?>/';
      const path = '<?php echo base_url(); ?>';
      const date = '<?php echo date("Y-m-d") ?>';

	  $(".full_day").on("change", function(e) {
            var curId = this.id.split("_")[1];
			$("#quarantine_"+curId).val(0);
			$("#undertime_"+curId).val(0);
			//$("#late_"+curId).val(0);
			$("#absent_"+curId).val(0);
			$("#leave_"+curId).val(0);
            // console.log(curId);
            // console.log($(this).val());
		});

        $(".absent").on("change", function(e) {
            var curId = this.id.split("_")[1];
			$("#fullday_"+curId).val(0);
			$("#overtime_"+curId).val(0);
			$("#late_"+curId).val(0);
			// $("#absent_"+curId).val(0);
			// $("#leave_"+curId).val(0);
            console.log(curId);
            // console.log($(this).val());
		});

        $(".leave").on("change", function(e) {
            var curId = this.id.split("_")[1];
			$("#fullday_"+curId).val(0);
			$("#overtime_"+curId).val(0);
			$("#late_"+curId).val(0);
			// $("#absent_"+curId).val(0);
			// $("#leave_"+curId).val(0);
            // console.log(curId);
            // console.log($(this).val());
		});

  });
</script>