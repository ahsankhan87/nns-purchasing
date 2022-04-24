<div class="row profile">
	<div class="col-md-12">
		<!--BEGIN TABS-->
        <?php
        if($this->session->flashdata('message'))
        {
            echo "<div class='alert alert-success fade in'>";
            echo $this->session->flashdata('message');
            echo '</div>';
        }
        if($this->session->flashdata('error'))
        {
            echo "<div class='alert alert-danger fade in'>";
            echo $this->session->flashdata('error');
            echo '</div>';
        }
        ?>
        <?php 
        $attributes = array('class' => 'horizontal-form','enctype'=>"multipart/form-data");
        echo validation_errors();
        echo form_open('hr_finance/C_employees/create',$attributes);
        ?>		
        <div class="tabbable tabbable-custom tabbable-custom-profile">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab_1_11" data-toggle="tab">Basic Information</a>
                </li>
                <li class="">
                    <a href="#tab_1_13" data-toggle="tab">Employment Details</a>
                </li>
                <!-- <li class="">
                    <a href="#tab_1_16" data-toggle="tab">Identification & Certificates</a>
                </li>
                <li class="">
                    <a href="#tab_1_19" data-toggle="tab">Cash Advances & Deduction Reports</a>
                </li> -->
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1_11">
                    <div class="row">
                        <div class="col-md-12">
                            
                            <!-- BEGIN FORM-->
                            <!-- <form action="#" class="horizontal-form"> -->
                                <div class="form-body">
                                    <!-- <h3 class="form-section">Person Info</h3> -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Upload Photo (jpg,png,gif)</label>
                                                <input type="file" name="picture" class="form-control" />
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">First Name</label>
                                                <input type="text" name="first_name" value="<?php echo set_value('first_name') ?>"  class="form-control">
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Middle Name</label>
                                                <input type="text" name="middle_name" class="form-control" value="<?php echo set_value('middle_name') ?>">
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Last Name</label>
                                                <input type="text" name="last_name" class="form-control" value="<?php echo set_value('last_name') ?>">
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Suffix</label>
                                                <input type="text" name="suffix" class="form-control" value="<?php echo set_value('suffix') ?>">
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Nickname</label>
                                                <input type="text" name="nick_name" class="form-control" value="<?php echo set_value('nick_name') ?>">
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Gender</label>
                                                
                                                <select name="gender" id="" class="form-control" <?php echo set_value('gender') ?>>
                                                    <option value="male">Male</option>
                                                    <option value="female">Female</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Date of Birth</label>
                                                <input type="date" name="dob" class="form-control" value="<?php echo set_value('dob') ?>">
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Civil Status</label>
                                                <select class="form-control" name="marital_status" <?php echo set_value('marital_status') ?>>
                                                    <option value="Single">Single</option>
                                                    <option value="Married">Married</option>
                                                </select>
									
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Address</label>
                                                <textarea name="address" id="" class="form-control" <?php echo set_value('address') ?>></textarea>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Contact No.</label>
                                                <input type="number" name="contact" class="form-control" value="<?php echo set_value('contact') ?>">
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->

                                </div>
                                <!-- <div class="form-actions right">
                                    <button type="button" class="btn btn-default">Cancel</button>
                                    <button type="submit" class="btn btn-info"><i class="fa fa-check"></i> Save</button>
                                </div> -->
                            <!-- </form> -->
                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
                            <!--tab_1_2-->
                <div class="tab-pane" id="tab_1_13">
                    <div class="row profile-account">
                        
                        <div class="col-md-12">
                            
                            <!-- BEGIN FORM-->
                            <!-- <form action="#" class="horizontal-form"> -->
                                <div class="form-body">
                                    <!-- <h3 class="form-section">Person Info</h3> -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Employee No.</label>
                                                <input type="text" name="emp_no" value="<?php echo set_value('emp_no') ?>"  class="form-control" >
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Position</label>
                                                <input type="text" name="position" class="form-control" value="<?php echo set_value('position') ?>">
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Date Hired</label>
                                                <input type="date" name="hire_date" value="<?php echo set_value('hire_date') ?>"  class="form-control" >
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <!-- <label class="control-label">Length of Service</label> -->
                                                <?php 
                                                    // $date1 = new DateTime($values['hire_date']);
                                                    // $date2 = new DateTime(date("Y-m-d"));
                                                    
                                                    // $interval = $date1->diff($date2);
                                                    // echo $interval->y . " years, " . $interval->m." months, ".$interval->d." days "; 
                                                    
                                                    // shows the total amount of days (not divided into years, months and days like above)
                                                    // echo "difference " . $interval->days . " days ";
                                                ?>
                                                <!-- <input type="text" id="position" class="form-control"  value="<?php echo $interval->y . " years, " . $interval->m." months, ".$interval->d." days "; ?>" disabled> -->
                                                
                                                <label class="control-label">SSS</label>
                                                <input type="text" name="sss" value="<?php echo set_value('sss') ?>"  class="form-control" >
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Philhealth</label>
                                                <input type="text" name="phil_health" class="form-control"  value="<?php echo set_value('phil_health') ?>" >
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Pag-ibig</label>
                                                <input type="text" name="pag_ibig" value="<?php echo set_value('pag_ibig') ?>" class="form-control" >
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                           
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Active Status</label>
                                                <select class="form-control" name="status" <?php echo set_value('status') ?> >
                                                    <option value="Active">Active</option>
                                                    <option value="Inactive">Inactive</option>
                                                    <option value="Resign">Resign</option>
                                                    <option value="Deceased">Deceased</option>
                                                </select>
                                                
                                            </div>
                                        </div>
                                        <!--/span-->
                                        
                                    </div>
                                    <!--/row-->
                                </div>
                                <!-- <div class="form-actions right">
                                    <button type="button" class="btn btn-default">Cancel</button>
                                    <button type="submit" class="btn btn-info"><i class="fa fa-check"></i> Save</button>
                                </div> -->
                                
                        </div>
                        <!--end col-md-9-->
                    </div>
                    
                </div>
                <!--end tab-pane-->
                
                <!-- <div class="tab-pane" id="tab_1_16">
                    <div class="row">
                        <div class="col-md-12">
                            
                            <div class="portlet-body">
                                <table class="table table-striped table-bordered table-advance table-hover" id='emp_documents'>
                                    <thead>
                                        <tr>
                                            <th>
                                                Document Name
                                            </th>
                                            <th class="hidden-xs">
                                                Reference No.
                                            </th>
                                            <th>
                                                Expiration
                                            </th>
                                            <th>
                                                Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-center" id="document_table">        
                                    </tbody>
                                    
                                </table>
                            </div>
                            <div class="text-right">  
                                <a href="#" id="add" data-toggle="modal" data-target="#add_data_Modal" class="btn btn-warning">Add new</a>  
                            </div>
                        </div>
                        
                    </div>
                </div>
                 -->
                <!--end tab-pane 1_6-->
                <!-- <div class="tab-pane" id="tab_1_19">
                    <div class="row">
                        <div class="col-md-12">
                        <div class="portlet-body">
                                <table class="table table-striped table-bordered table-advance table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                Date
                                            </th>
                                            <th class="hidden-xs">
                                                Type
                                            </th>
                                            <th>
                                                Description
                                            </th>
                                            <th>
                                                Amount
                                            </th>
                                            <th>Balance</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
                            </div>	
                        </div>
                    </div>
                </div> -->
                <!--end tab-pane 1_9-->
                <div class="form-actions right">
                        <input type="submit" class="btn btn-warning" value="Save" />
                        <button type="button" onclick="window.history.back();" class="btn btn-default">Cancel</button>
                        
                    </div>
                <?php echo form_close(); ?>
                <!-- END FORM-->
            </div>
        </div>
	</div>
</div>

 <script>  
 $(document).ready(function(){  
    
    const site_url = '<?php echo site_url($langs); ?>';
    const path = '<?php echo base_url(); ?>';
    const emp_id = $('#employee_id').val();
  
 });  
 </script>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script> -->
