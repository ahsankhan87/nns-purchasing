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
				<form class="form-inline" method="post" action="<?php echo site_url('hr_finance/C_employees_attendance')?>" role="form">
        			<div class="form-group">
        				<label for="exampleInputEmail2">Select Month</label>
        				<input type="month" class="form-control" name="cur_month" value="<?php echo date("Y-m"); ?>" placeholder="Select/Enter Month ie. 2017-01">
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
if(count(@$employees))
{
?>

<div class="row">
    <div class="col-sm-12">
    
        <table class="table table-striped table-bordered table-hover" id="">
            <thead>
                <tr>
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
            
            foreach($employees as $list)
            {
                echo '<tr>';
                echo '<td>'.$list['first_name'].'</td>';
                $employee_id = $list['id'];
                
                foreach($attendance_days as $days)
                {
                    echo '<td>'. $this->M_employee_attendance->get_employee_attendance($employee_id,$days['dated']).'</td>';
                }
                
                echo '</tr>';
            }
            ?>
            </tbody>
        </table>
    </div>
    
</div>


<?php } ?>