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
                
                <td><select name="full_day[]" class="form-control" id="full">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="overtime[]" class="form-control">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="weekend[]" class="form-control">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="holiday[]" class="form-control">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="quarantine[]" class="form-control">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="undertime[]" class="form-control">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="late[]" class="form-control">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="absent[]" class="form-control">
                    <option value="1">Yes</option>
                    <option value="0">No</option>
                    </select>
                </td>
                
                <td><select name="leave[]" class="form-control">
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

	  $("#basic_salary").on("keyup change", function(e) {
			calc_grand_total();
		});

	  $("#food_allow").on("keyup change", function(e) {
			calc_grand_total();
		});
		
		$("#transportation_allow").on("keyup change", function(e) {
			calc_grand_total();
		}); 
		
		$("#other_allow").on("keyup change", function(e) {
			calc_grand_total();
		});
		
		/////////////ADD NEW LINES END HERE
        function calc_grand_total() {
            var basic_salary = 0;
            var food_allow = 0;
            var transportation_allow = 0;
            var other_allow = 0;

            basic_salary = $('#basic_salary').val();
            food_allow = $('#food_allow').val();
            transportation_allow = $("#transportation_allow").val();
            other_allow = $("#other_allow").val();
            
            basic_salary = (basic_salary ? basic_salary : 0);
            food_allow = (food_allow ? food_allow : 0);
            transportation_allow  = (transportation_allow ? transportation_allow : 0);
            other_allow = (other_allow ? other_allow : 0);
            
            grand_total = parseFloat(basic_salary) + parseFloat(food_allow) + parseFloat(transportation_allow) + parseFloat(other_allow);
            //console.log(grand_total);
            $('#monthly_total').val(parseFloat(grand_total).toFixed(2));
            
        }
  });
</script>