<div class="row profile">
	<div class="col-md-12">
		<!--BEGIN TABS-->
        <?php foreach($emp_detail as $values): ?>
		<div class="tabbable tabbable-custom">
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#tab_1_1" data-toggle="tab">Employee Information</a>
				</li>
				<!-- <li class="">
					<a href="#tab_1_3" data-toggle="tab">Employmet Details</a>
				</li>
				<li class="">
					<a href="#tab_1_6" data-toggle="tab">Identification & Certificates</a>
				</li>
                <li class="">
					<a href="#tab_1_9" data-toggle="tab">Cash Advances & Deduction Reports</a>
				</li> -->
			</ul>
			<div class="tab-content">
				<div class="tab-pane active">
					<div class="row">
                        <div class="col-md-3">
                            <div>
                                <?php
                                    if($values['picture'] == ''){
                                        echo '<img src="'.base_url('assets/img/no-image.png').'" alt="no-image" width="210" height="180" class="thumbnail">';
                                    }else {
                                        echo '<img src="'.base_url('images/employees/'.$values['picture']).'" width="210" height="180" class="thumbnail" alt="Employee Picture">';
                                    }
                                ?>
                            </div>
						</div>
						<div class="col-md-9">
                        
                            <div class="row">
                            
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-5"><strong>Nickname</strong>:</label>
                                        <div class="col-md-7">
                                            <p class="">
                                                <?php echo $values['nick_name']; ?>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--/row-->
                            <div class="row">
                                <!--/span-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-5"><strong>Position</strong>:</label>
                                        <div class="col-md-7">
                                            <p class="">
                                                <?php echo $values['position']; ?>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <!--/row-->
                        
                            <div class="row">
                                <!--/span-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-5"><strong>Contact No.</strong>:</label>
                                        <div class="col-md-7">
                                            <p class="">
                                                <?php echo $values['contact']; ?>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <!--/row-->

                            
                            <div class="row">
                                <!--/span-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-5"><strong>Service Length</strong>:</label>
                                        <div class="col-md-7">
                                            <p class="">
                                                <?php 
                                                    $date1 = new DateTime($values['hire_date']);
                                                    $date2 = new DateTime(date("Y-m-d"));
                                                    
                                                    $interval = $date1->diff($date2);
                                                    echo $interval->y . " years, " . $interval->m." months, ".$interval->d." days "; 
                                                    
                                                    // shows the total amount of days (not divided into years, months and days like above)
                                                    // echo "difference " . $interval->days . " days ";
                                                ?>
                                                
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <!--/row-->
                            
                            <div class="row">
                                <!--/span-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-5"><strong>Active Status</strong>:</label>
                                        <div class="col-md-7">
                                            <p class="">
                                                <?php echo $values['status']; ?>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <!--/row-->
							
						</div>
					</div>
                    
                    <div class="tabbable tabbable-custom tabbable-custom-profile">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab_1_11" data-toggle="tab">Basic Information</a>
                            </li>
                            <li class="">
                                <a href="#tab_1_13" data-toggle="tab">Employment Details</a>
                            </li>
                            <li class="">
                                <a href="#tab_1_16" data-toggle="tab">Identification & Certificates</a>
                            </li>
                            <li class="">
                                <a href="#tab_1_19" data-toggle="tab">Cash Advances & Deduction Reports</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_1_11">
                                <div class="row">
                                    <div class="col-md-12">
                                        
                                        <!-- BEGIN FORM-->
                                        <form action="#" class="horizontal-form">
                                            <div class="form-body">
                                                <!-- <h3 class="form-section">Person Info</h3> -->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">First Name</label>
                                                            <input type="text" id="firstName" value="<?php echo $values['first_name']; ?>" disabled class="form-control" >
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Middle Name</label>
                                                            <input type="text" id="lastName" class="form-control"  value="<?php echo $values['middle_name']; ?>" disabled>
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <!--/row-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Last Name</label>
                                                            <input type="text" id="last_name" value="<?php echo $values['last_name']; ?>" disabled class="form-control" >
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Suffix</label>
                                                            <input type="text" id="Suffix" class="form-control"  value="<?php echo $values['suffix']; ?>" disabled>
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <!--/row-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Nickname</label>
                                                            <input type="text" id="nick_name" value="<?php echo $values['nick_name']; ?>" disabled class="form-control" >
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Gender</label>
                                                            <input type="text" id="gender" class="form-control"  value="<?php echo $values['gender']; ?>" disabled>
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <!--/row-->

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Date of Birth</label>
                                                            <input type="date" id="dob" value="<?php echo $values['dob']; ?>" disabled class="form-control" >
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Civil Status</label>
                                                            <input type="text" id="marital_status" class="form-control"  value="<?php echo $values['marital_status']; ?>" disabled>
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <!--/row-->

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Address</label>
                                                            <textarea name="address" id="" class="form-control" disabled><?php echo $values['address']; ?></textarea>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Contact No.</label>
                                                            <input type="text" id="contact" class="form-control"  value="<?php echo $values['contact']; ?>" disabled>
                                                            
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
                                        </form>
                                        <!-- END FORM-->
                                    </div>
                                </div>
                            </div>
                                        <!--tab_1_2-->
                            <div class="tab-pane" id="tab_1_13">
                                <div class="row profile-account">
                                   
                                    <div class="col-md-12">
                                        
                                        <!-- BEGIN FORM-->
                                        <form action="#" class="horizontal-form">
                                            <div class="form-body">
                                                <!-- <h3 class="form-section">Person Info</h3> -->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Employee No.</label>
                                                            <input type="text" id="emp_no" value="<?php echo $values['emp_no']; ?>" disabled class="form-control" >
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Position</label>
                                                            <input type="text" id="position" class="form-control"  value="<?php echo $values['position']; ?>" disabled>
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <!--/row-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Date Hired</label>
                                                            <input type="date" id="last_name" value="<?php echo $values['hire_date']; ?>" disabled class="form-control" >
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Length of Service</label>
                                                            <?php 
                                                                $date1 = new DateTime($values['hire_date']);
                                                                $date2 = new DateTime(date("Y-m-d"));
                                                                
                                                                $interval = $date1->diff($date2);
                                                                // echo $interval->y . " years, " . $interval->m." months, ".$interval->d." days "; 
                                                                
                                                                // shows the total amount of days (not divided into years, months and days like above)
                                                                // echo "difference " . $interval->days . " days ";
                                                            ?>
                                                            <input type="text" id="position" class="form-control"  value="<?php echo $interval->y . " years, " . $interval->m." months, ".$interval->d." days "; ?>" disabled>
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <!--/row-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">SSS</label>
                                                            <input type="text" id="sss" value="<?php echo $values['sss']; ?>" disabled class="form-control" >
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Philhealth</label>
                                                            <input type="text" id="Philhealth" class="form-control"  value="<?php echo $values['phil_health']; ?>" disabled>
                                                            
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <!--/row-->

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label">Pag-ibig</label>
                                                            <input type="text" id="pag_ibig" value="<?php echo $values['pag_ibig']; ?>" disabled class="form-control" >
                                                            
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
                                        </form>
                                        <!-- END FORM-->
                                    </div>
                                    <!--end col-md-9-->
                                </div>
                            </div>
                            <!--end tab-pane-->
                            <div class="tab-pane" id="tab_1_16">
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
                                                            Document Status
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
                                            <a href="#" id="add" data-toggle="modal" data-target="#add_data_Modal" class="btn btn-primary btn-sm">Add New</a>  
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            
                            <!--end tab-pane 1_6-->
                            <div class="tab-pane" id="tab_1_19">
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
                            </div>
                            <!--end tab-pane 1_9-->
                        </div>
                    </div>
				</div>
                <div class="text-right">
                    <a href="<?php echo site_url("hr_finance/C_employees/edit/".$values['id']); ?>" class="btn btn-warning">Edit</a>
                </div>
				
			</div>
		</div>
		<!--END TABS-->
        <?php endforeach; ?>
	</div>
</div>

<div id="add_data_Modal" class="modal fade">  
      <div class="modal-dialog">  
           <div class="modal-content">  
                <div class="modal-header">  
                     <button type="button" class="close" data-dismiss="modal">&times;</button>  
                     <h4 class="modal-title">Employees Identification & Certificates</h4>  
                </div>  
                <div class="modal-body">  
                    <form action="#" id="insert_form" class="form-horizontal">
                        
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">Document Name</label>
                                <div class="col-md-9">
                                    <input name="document_name" id="document_name" placeholder="Document Name" class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Document File (png|jpeg|pdf)</label>
                                <div class="col-md-9">
                                    <input name="picture" id="picture" placeholder="Document" class="form-control" type="file">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Reference No.</label>
                                <div class="col-md-9">
                                    <input name="reference_no" id="reference_no" placeholder="Reference No." class="form-control" type="text">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">Expiration</label>
                                <div class="col-md-9">
                                    <input name="expiration" id="expiration" placeholder="Expiration" class="form-control" type="date">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="employee_id" id="employee_id" value="<?php echo $values['id']; ?>" /> 
                    
                <!-- </form> -->
                </div>  
                <div class="modal-footer">  
                    <input type="submit" name="insert" id="insert" value="Insert" class="btn btn-success" />  
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                </div>  
                </form>
           </div>  
      </div>  
 </div>  
 <script>  
 $(document).ready(function(){  
    
    const site_url = '<?php echo site_url($langs); ?>';
    const path = '<?php echo base_url(); ?>';
    const emp_id = $('#employee_id').val();
  ///////////////////
  get_emp_documents(emp_id);
  ////////////////////////
  //GET ACCOUNT DROPDOWN LIST
  function get_emp_documents(emp_id) {
  
    let document_table = '';
    $.ajax({
          url: site_url+"/hr_finance/C_employees/get_employees_documents/"+emp_id,
          type: 'GET',
          dataType: 'json', // added data type
          success: function(data) 
          {
              //console.log(data);
              let i =0;
              $.each(data,function(index, value){
                var expiration_date = new Date(value.expiration);
                var today = new Date();
                var is_doc_expired = (today.getTime() <= expiration_date.getTime() ? false : true);

               document_table += '<tr>';
                document_table += '<td>';
                    document_table += value.document_name;
                document_table += '</td>';
                document_table += '<td>';
                    document_table += value.reference_no;
                document_table += '</td>';
                document_table += '<td class="'+(is_doc_expired ? "text-danger" : "text-success")+'">';
                    document_table += expiration_date.toLocaleDateString("en-US");
                document_table += '</td>';
                document_table += '<td>';
                    document_table += (is_doc_expired ? '<i class="fa fa-exclamation-circle text-danger" aria-hidden="true"></i>' : '<i class="fa fa-check-circle text-success"></i>');
                document_table += '</td>';
                document_table += '<td>';
                document_table += '<a href="'+path+'images/employees/documents/'+value.picture+'" target="_blank" title="View">View</a> | ';
                    document_table += '<a href="#" id="'+value.id+'" data-picture="'+value.picture+'" title="Remove" class="text-danger remove_doc"><i class="fa fa-trash-o"></i></a>';
                document_table += '</td>';
                
               document_table += '</tr>';
               
              });
              $('#document_table').html(document_table);

          },
          error: function (xhr, ajaxOptions, thrownError) {
              console.log(xhr.status);
              console.log(thrownError);
          }
    });
  }
  ///////////////////
        $(document).on('click', '.remove_doc', function(e){ 
            e.preventDefault();
            //var tr = $(this).closest('tr'),
            if(!confirm("Are you sure you want to delete?")) {
                return false;
            }

            del_id = $(this).attr('id');
            picture = $(this).attr('data-picture');
            console.log(picture);
            $.ajax({
                method:"POST",
                url: site_url+"/hr_finance/C_employees/delete_emp_document/"+ del_id+'/'+picture,
                cache: false,
                success:function(result){
                    if (result) {
                        toastr.success("Document removed successfully",'Success!');
                        
                    }else{
                        toastr.error("Error in removing document",'Error!');
                    }
                    get_emp_documents(emp_id);
                    console.log(result);
                }
            });
        });

      $('#add').click(function(){  
           $('#insert').val("Insert");  
           $('#insert_form')[0].reset();  
      });  

      $(document).on('click', '.edit_data', function(){  
           var employee_id = $(this).attr("id");  
           $.ajax({  
                url:"fetch.php",  
                method:"POST",  
                data:{employee_id:employee_id},  
                dataType:"json",  
                success:function(data){  
                     $('#name').val(data.name);  
                     $('#address').val(data.address);  
                     $('#gender').val(data.gender);  
                     $('#designation').val(data.designation);  
                     $('#age').val(data.age);  
                     $('#employee_id').val(data.id);  
                     $('#insert').val("Update");  
                     $('#add_data_Modal').modal('show');  
                }  
           });  
      });  
      $('#insert_form').on("submit", function(event){  
           event.preventDefault();  
           if($('#document_name').val() == "")  
           {  
                // alert("Name is required");  
                toastr.info("Document Name is required",'Info!');  
           }  
        //    else if($('#address').val() == '')  
        //    {  
        //         alert("Address is required");  
        //    }  
        //    else if($('#designation').val() == '')  
        //    {  
        //         alert("Designation is required");  
        //    }  
        //    else if($('#age').val() == '')  
        //    {  
        //         alert("Age is required");  
        //    }  
           else  
           {  
            var formData = new FormData(this);
            var files = $('#picture')[0].files;
            
            if(files != undefined){
                formData.append('picture',files[0]);
            }
            console.log(files);
            console.log(site_url);
            
                $.ajax({  
                     url:site_url+"/hr_finance/C_employees/create_emp_document",  
                     method:"POST",  
                     data:formData,
                    cache: false,
                    processData: false,
                    contentType: false,
              
                     beforeSend:function(){  
                          $('#insert').val("Inserting");  
                     },  
                     success:function(data, textStatus, jqXHR){ 
                        toastr.success("Data saved successfully",'Success'); 
                          $('#insert_form')[0].reset();  
                          $('#add_data_Modal').modal('hide');  
                          $('#document_table').html(data);
                          get_emp_documents(emp_id);
                        //   console.log(data);  
                     },
                     error: function(jqXHR, textStatus, errorThrown){
                        //if fails 
                        toastr.error("Error in data",'Error!');    
                        console.log(jqXHR+' '+textStatus);
                    }
                });  
           }  
      });  
      $(document).on('click', '.view_data', function(){  
           var employee_id = $(this).attr("id");  
           if(employee_id != '')  
           {  
                $.ajax({  
                     url:"select.php",  
                     method:"POST",  
                     data:{employee_id:employee_id},  
                     success:function(data){  
                          $('#employee_detail').html(data);  
                          $('#dataModal').modal('show');  
                     }  
                });  
           }            
      });  
 });  
 </script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
