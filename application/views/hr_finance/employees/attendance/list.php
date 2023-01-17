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
 <p>
    <a  href="<?php echo site_url("hr_finance").'/'.$this->uri->segment(3); ?>/add" class="btn btn-success"><?php echo $this->lang->line('add_a_new');?></th></a>
    <a  href="<?php echo site_url("hr_finance").'/'.$this->uri->segment(3); ?>/view_all" class="btn btn-success">View All Employees</th></a>
</p>
<div class="row hidden-print">
	<div class="col-md-12">
		<!-- BEGIN SAMPLE FORM PORTLET-->
		<div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-reorder"></i> Select Month
				</div>
				<div class="tools">
					<a href="" class="collapse"></a>
					<a href="#portlet-config" data-toggle="modal" class="config"></a>
					<a href="" class="reload"></a>
					<a href="" class="remove"></a>
				</div>
			</div>
			<div class="portlet-body">
				<form class="form-inline" method="post" action="<?php echo site_url('hr_finance/C_employees_attendance/index')?>" role="form">
        			<div class="form-group">
                        <label for="">Select Employee</label>
                        <?php echo form_dropdown('emp_id',$employeesDDL,'','class="form-control select2me"'); ?>
                        
                        <label for="exampleInputEmail2">Select Date</label>
                        <input type="month" class="form-control" name="cur_date" value="<?php echo date("Y-m"); ?>">
        			</div>
                    <!--
        			<div class="form-group">
        				<label for="exampleInputPassword2">To Date</label>
        				<input type="month" class="form-control" name="to_date" placeholder="To Date">
        			</div>
        			-->
        			<button type="submit" class="btn btn-primary">View</button>
        		</form>
			</div>
		</div>
		<!-- END SAMPLE FORM PORTLET-->
	</div>
</div>
<!-- END DAte Search-->

<?php 
if(count((array) @$emp_attendance))
{
?>
<div class="row">
    <div class="col-sm-12">
        <table class="table table-striped table-bordered table-hover" id="">
            <thead>
                <tr>
                    <th>Name</th>
                    <!-- <th>Full Days</th> -->
                    <th>Overtime Days</th>
                    <th>Weekend Days</th>
                    <th>Undertime Days</th>
                    <th>Holiday Days</th>
                    <!-- <th>Quarantine Days</th> -->
                    <th>Late Days</th>
                    <th>Absent Days</th>
                    <th>Leave Days</th>
                </tr>
            </thead>
            <thead>
                <tr>
                    <td><?php echo $this->M_employees->get_empName($emp_id);?></td>
                    <?php
                    (double) $full_days=0;
                    (double) $overtime_days = 0;
                    (double) $weekend_days = 0;
                    (double) $undertime_days = 0;
                    (double) $holidays=0;
                    (double) $quarantine_days=0;
                    (double) $late_days=0;
                    (double) $absent_days=0;
                    (double) $leave_days=0; 
                    foreach($emp_attendance as $list)
                    {
                         $full_days  +=($list['full_day'] ? 1 : 0);
                         $overtime_days  += ($list['overtime'] ? 1 : 0);
                         $weekend_days  += ($list['weekend'] ? 1 : 0);
                         $undertime_days  += ($list['undertime'] ? 1 : 0);
                         $holidays +=($list['holiday'] ? 1 : 0);
                         $quarantine_days +=($list['quarantine'] ? 1 : 0);
                         $late_days +=($list['late'] ? 1 : 0);
                         $absent_days +=($list['absent'] ? 1 : 0);
                         $leave_days +=($list['leave'] ? 1 : 0); 
                    }
                    ?>
                    <!-- <td><?php echo $full_days; ?></td> -->
                    <td><?php echo $overtime_days; ?></td>
                    <td><?php echo $weekend_days; ?></td>
                    <td><?php echo $undertime_days; ?></td>
                    <td><?php echo $holidays; ?></td>
                    <!-- <td><?php echo $quarantine_days; ?></td> -->
                    <td><?php echo $late_days; ?></td>
                    <td><?php echo $absent_days; ?></td>
                    <td><?php echo $leave_days; ?></td>
                </tr>
            </thead>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <table class="table table-striped table-bordered table-hover" id="">
            <thead>
                <tr>
                    <th>Day</th>
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
            <?php //echo var_dump($students); 
            
            foreach($emp_attendance as $list)
            {
                echo '<tr class="text-center">';
                echo '<td>'.date("d-M", strtotime($list['dated'])).'</td>';
                echo '<td>'.date("h:i A", strtotime($list['time_in'])).'</td>';
                echo '<td>'.date("h:i A", strtotime($list['time_out'])).'</td>';
                echo '<td>'.($list['full_day'] ? "Yes" : "No").'</td>';
                echo '<td>'.($list['overtime'] ? "Yes" : "No").'</td>';
                echo '<td>'.($list['weekend'] ? "Yes" : "No").'</td>';
                echo '<td>'.($list['holiday'] ? "Yes" : "No").'</td>';
                echo '<td>'.($list['quarantine'] ? "Yes" : "No").'</td>';
                echo '<td>'.($list['undertime'] ? "Yes" : "No").'</td>';
                echo '<td>'.($list['late'] ? "Yes" : "No").'</td>';
                echo '<td>'.($list['absent'] ? "Yes" : "No").'</td>';
                echo '<td>'.($list['leave'] ? "Yes" : "No").'</td>';
                
                echo '</tr>';
            }
            ?>
            </tbody>
        </table>
    </div>
    
</div>


<?php } ?>