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
 <p><a  href="<?php echo site_url("hr_finance").'/'.$this->uri->segment(3); ?>/add" class="btn btn-success"><?php echo $this->lang->line('add_a_new');?></th></a></p>
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
				<form class="form-inline" method="post" action="<?php echo site_url('hr_finance/C_employees_attendance/view_all')?>" role="form">
        			<div class="form-group">
        				<label for="exampleInputEmail2">Select Month</label>
        				<input type="date" class="form-control" name="cur_date" value="<?php echo date("Y-m-d"); ?>">
        			</div>
                    <!--
        			<div class="form-group">
        				<label for="exampleInputPassword2">To Date</label>
        				<input type="month" class="form-control" name="to_date" placeholder="To Date">
        			</div>
        			-->
        			<button type="submit" class="btn btn-default">Submit</button>
        		</form>
			</div>
		</div>
		<!-- END SAMPLE FORM PORTLET-->
	</div>
</div>
<!-- END DAte Search-->

<?php 
if(count((array) @$employees))
{
?>

<div class="row">
    <div class="col-sm-12">
        <div><h5>Date: <?php echo date("m/d/Y",strtotime($cur_date));?></h5></div>
        <table class="table table-striped table-bordered table-hover" id="">
            <thead>
                <tr>
                    <th>Name</th>    
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
            $start_date = FY_START_DATE; //date("Y-m-d", strtotime("last year"));
            $to_date = FY_END_DATE; //date("Y-m-d");
            
            foreach($employees as $list)
            {
                echo '<tr class="text-center">';
                echo '<td>'.$list['first_name'].'</td>';
                $employee_id = $list['id'];
                $emp_attendance = $this->M_employee_attendance->get_emp_attendance_days($employee_id,$cur_date,$start_date,$to_date);
                foreach($emp_attendance as $list_1)
                {
                    echo '<td>'.date("h:i A", strtotime($list_1['time_in'])).'</td>';
                    echo '<td>'.date("h:i A", strtotime($list_1['time_out'])).'</td>';
                    echo '<td>'.($list_1['full_day'] ? "Yes" : "No").'</td>';
                    echo '<td>'.($list_1['overtime'] ? "Yes" : "No").'</td>';
                    echo '<td>'.($list_1['weekend'] ? "Yes" : "No").'</td>';
                    echo '<td>'.($list_1['holiday'] ? "Yes" : "No").'</td>';
                    echo '<td>'.($list_1['quarantine'] ? "Yes" : "No").'</td>';
                    echo '<td>'.($list_1['undertime'] ? "Yes" : "No").'</td>';
                    echo '<td>'.($list_1['late'] ? "Yes" : "No").'</td>';
                    echo '<td>'.($list_1['absent'] ? "Yes" : "No").'</td>';
                    echo '<td>'.($list_1['leave'] ? "Yes" : "No").'</td>';
                    
                }
                
                echo '</tr>';
            }
            ?>
            </tbody>
        </table>
    </div>
    
</div>


<?php } ?>