<?php
if($this->session->flashdata('message'))
{
    echo "<div class='alert alert-danger fade in'>";
    echo $this->session->flashdata('message');
    echo '</div>';
}
?>
<div class="row">
    <div class="col-sm-12">
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-reorder"></i>Employee Edit Form
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a>
					<a href="#portlet-config" data-toggle="modal" class="config"></a>
					<a href="javascript:;" class="reload"></a>
					<a href="javascript:;" class="remove"></a>
				</div>
			</div>
			<div class="portlet-body form">
				<?php
				if(isset($flash_message)){
					if($flash_message == TRUE)
					{
					echo '<div class="alert alert-success">';
						echo '<a class="close" data-dismiss="alert">x</a>';
						echo '<strong>Well done!</strong> new supplier created with success.';
					echo '</div>';       
					}else{
					echo '<div class="alert alert-error">';
						echo '<a class="close" data-dismiss="alert">x</a>';
						echo '<strong>Oh snap!</strong> change a few things up and try submitting again.';
					echo '</div>';          
					}
				}
				?>
				<!-- BEGIN FORM-->
				<?php 
                  foreach($employee as $values):
                    $attributes = array('class' => 'horizontal-form', 'role' => 'form', 'enctype'=>"multipart/form-data");
                    echo validation_errors();
                    echo form_open('hr_finance/C_employees/edit',$attributes);
                    
                    echo form_hidden('id',$values['id']);
                    echo form_hidden('picture_old',$values['picture']);
                    ?>
					<div class="form-body">
						<h3 class="form-section">Basic Information</h3>
                        
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Upload Picture (jpg,png,gif)</label>
									<input type="file" name="picture" class="form-control"  />
									
								</div>
							</div>
							<!--/span-->
						</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">First Name</label>
									<input type="text" id="firstName" name="first_name" class="form-control" required="" value="<?php echo $values['first_name'] ?>"  placeholder="First Name"/>
									
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Middle Name</label>
									<input type="text" id="mName" name="middle_name" class="form-control" value="<?php echo $values['middle_name'] ?>"  placeholder="Middle Name" />
								
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
                        <div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Last Name</label>
									<input type="text" id="lastName" name="last_name" class="form-control" value="<?php echo $values['last_name'] ?>"  placeholder="Last Name" />
								
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Suffix</label>
									<input type="text" id="suffix" name="suffix" class="form-control" value="<?php echo $values['suffix'] ?>"  placeholder="Suffix" />
								
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Nickname</label>
									<input type="text" id="nick_name" name="nick_name" class="form-control" value="<?php echo $values['nick_name'] ?>"  placeholder="Nickname" />
								
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Gender</label>
									<select class="form-control" name="gender" <?php echo set_value('gender') ?> >
										<option <?php ($values['gender'] == 'Male' ? "selected=''" : '') ?> value="Male">Male</option>
										<option <?php ($values['gender'] == 'Female' ? "selected=''" : '') ?> value="Female">Female</option>
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
									<input type="date" name="dob" class="form-control" placeholder="dd/mm/yyyy"  value="<?php echo $values['dob'] ?>" />
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label">Civil Status</label>
									<select class="form-control" name="marital_status" <?php echo set_value('marital_status') ?> >
										<option <?php ($values['marital_status'] == 'Single' ? "selected=''" : '') ?> value="Single">Single</option>
										<option <?php ($values['marital_status'] == 'Married' ? "selected=''" : '') ?> value="Married">Married</option>
									</select>
									
                                </div>
                            </div>
							<!--/span-->
							
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								<label class="control-label" for="Contact">Contact No:</label>
                                    <input type="number" class="form-control" id="" name="contact" value="<?php echo $values['contact'] ?>"  placeholder="Contact No" />
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
                                  <label class="control-label" for="Email">Email:</label>
                                    <input type="email" class="form-control" id="Email" name="email"  value="<?php echo $values['email'] ?>"  placeholder="Email" />
                                </div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						<!-- <div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>City</label>
									<input type="text" name="city"  value="<?php echo set_value('city') ?>" class="form-control" />
								</div>
							</div> -->
							<!--/span-->
							<!-- <div class="col-md-6"> -->
								
							<?php 
 
							// echo '<div class="form-group"><label class="control-label for="">Country</label>';

							// $country = array( "" => "Select Country","Afghanistan" => "Afghanistan" , "Albania" => "Albania" , "Algeria" => "Algeria" , "American Samoa" => "American Samoa" , "Andorra" => "Andorra" , "Angola" => "Angola" , "Anguilla" => "Anguilla" , "Antarctica" => "Antarctica" , "Antigua and Barbuda" => "Antigua and Barbuda" , "Argentina" => "Argentina" , "Armenia" => " Armenia " , " Aruba " => " Aruba " , " Australia " => " Australia " , " Austria " => " Austria " , " Azerbaijan " => " Azerbaijan " , " Bahamas " => " Bahamas " , " Bahrain " => " Bahrain " , " Bangladesh " => " Bangladesh " , " Barbados " => " Barbados " , " Belarus " => " Belarus " , " Belgium " => " Belgium " , " Belize " => " Belize " , " Benin " => " Benin " , " Bermuda " => " Bermuda " , " Bhutan " => " Bhutan " , " Bolivia " => " Bolivia " , " Bosnia and Herzegovina " => " Bosnia and Herzegovina " , " Botswana " => " Botswana " , " Bouvet Island " => " Bouvet Island " , " Brazil " => " Brazil " , " British Antarctic Territory " => " British Antarctic Territory " , " British Indian Ocean Territory " => " British Indian Ocean Territory " , " British Virgin Islands " => " British Virgin Islands " , " Brunei " => " Brunei " , " Bulgaria " => " Bulgaria " , " Burkina Faso " => " Burkina Faso " , " Burundi " => " Burundi " , " Cambodia " => " Cambodia " , " Cameroon " => " Cameroon " , " Canada " => " Canada " , " Canton and Enderbury Islands " => " Canton and Enderbury Islands " , " Cape Verde " => " Cape Verde " , " Cayman Islands " => " Cayman Islands " , " Central African Republic " => " Central African Republic " , " Chad " => " Chad " , " Chile " => " Chile " , " China " => " China " , " Christmas Island " => " Christmas Island " , " Cocos [Keeling] Islands " => " Cocos [Keeling] Islands " , " Colombia " => " Colombia " , " Comoros " => " Comoros " , " Congo - Brazzaville " => " Congo - Brazzaville " , " Congo - Kinshasa " => " Congo - Kinshasa " , " Cook Islands " => " Cook Islands " , " Costa Rica " => " Costa Rica " , " Croatia " => " Croatia " , " Cuba " => " Cuba " , " Cyprus " => " Cyprus " , " Czech Republic " => " Czech Republic " , " Côte d’Ivoire " => " Côte d’Ivoire " , " Denmark " => " Denmark " , " Djibouti " => " Djibouti " , " Dominica " => " Dominica " , " Dominican Republic " => " Dominican Republic " , " Dronning Maud Land " => " Dronning Maud Land " , " East Germany " => " East Germany " , " Ecuador " => " Ecuador " , " Egypt " => " Egypt " , " El Salvador " => " El Salvador " , " Equatorial Guinea " => " Equatorial Guinea " , " Eritrea " => " Eritrea " , " Estonia " => " Estonia " , " Ethiopia " => " Ethiopia " , " Falkland Islands " => " Falkland Islands " , " Faroe Islands " => " Faroe Islands " , " Fiji " => " Fiji " , " Finland " => " Finland " , " France " => " France " , " French Guiana " => " French Guiana " , " French Polynesia " => " French Polynesia " , " French Southern Territories " => " French Southern Territories " , " French Southern and Antarctic Territories " => " French Southern and Antarctic Territories " , " Gabon " => " Gabon " , " Gambia " => " Gambia " , " Georgia " => " Georgia " , " Germany " => " Germany " , " Ghana " => " Ghana " , " Gibraltar " => " Gibraltar " , " Greece " => " Greece " , " Greenland " => " Greenland " , " Grenada " => " Grenada " , " Guadeloupe " => " Guadeloupe " , " Guam " => " Guam " , " Guatemala " => " Guatemala " , " Guernsey " => " Guernsey " , " Guinea " => " Guinea " , " Guinea-Bissau " => " Guinea-Bissau " , " Guyana " => " Guyana " , " Haiti " => " Haiti " , " Heard Island and McDonald Islands " => " Heard Island and McDonald Islands " , " Honduras " => " Honduras " , " Hong Kong SAR China " => " Hong Kong SAR China " , " Hungary " => " Hungary " , " Iceland " => " Iceland " , "India" => "India" , " Indonesia " => " Indonesia " , " Iran " => " Iran " , " Iraq " => " Iraq " , " Ireland " => " Ireland " , " Isle of Man " => " Isle of Man " , " Israel " => " Israel " , " Italy " => " Italy " , " Jamaica " => " Jamaica " , " Japan " => " Japan " , " Jersey " => " Jersey " , " Johnston Island " => " Johnston Island " , " Jordan " => " Jordan " , " Kazakhstan " => " Kazakhstan " , " Kenya " => " Kenya " , " Kiribati " => " Kiribati " , " Kuwait " => " Kuwait " , " Kyrgyzstan " => " Kyrgyzstan " , " Laos " => " Laos " , " Latvia " => " Latvia " , " Lebanon " => " Lebanon " , " Lesotho " => " Lesotho " , " Liberia " => " Liberia " , " Libya " => " Libya " , " Liechtenstein " => " Liechtenstein " , " Lithuania " => " Lithuania " , " Luxembourg " => " Luxembourg " , " Macau SAR China " => " Macau SAR China " , " Macedonia " => " Macedonia " , " Madagascar " => " Madagascar " , " Malawi " => " Malawi " , " Malaysia " => " Malaysia " , " Maldives " => " Maldives " , " Mali " => " Mali " , " Malta " => " Malta " , " Marshall Islands " => " Marshall Islands " , " Martinique " => " Martinique " , " Mauritania " => " Mauritania " , " Mauritius " => " Mauritius " , " Mayotte " => " Mayotte " , " Metropolitan France " => " Metropolitan France " , " Mexico " => " Mexico " , " Micronesia " => " Micronesia " , " Midway Islands " => " Midway Islands " , " Moldova " => " Moldova " , " Monaco " => " Monaco " , " Mongolia " => " Mongolia " , " Montenegro " => " Montenegro " , " Montserrat " => " Montserrat " , " Morocco " => " Morocco " , " Mozambique " => " Mozambique " , " Myanmar [Burma] " => " Myanmar [Burma] " , " Namibia " => " Namibia " , " Nauru " => " Nauru " , " Nepal " => " Nepal " , " Netherlands " => " Netherlands " , " Netherlands Antilles " => " Netherlands Antilles " , " Neutral Zone " => " Neutral Zone " , " New Caledonia " => " New Caledonia " , " New Zealand " => " New Zealand " , " Nicaragua " => " Nicaragua " , " Niger " => " Niger " , " Nigeria " => " Nigeria " , " Niue " => " Niue " , " Norfolk Island " => " Norfolk Island " , " North Korea " => " North Korea " , " North Vietnam " => " North Vietnam " , " Northern Mariana Islands " => " Northern Mariana Islands " , " Norway " => " Norway " , " Oman " => " Oman " , " Pacific Islands Trust Territory " => " Pacific Islands Trust Territory " , " Pakistan " => " Pakistan " , " Palau " => " Palau " , " Palestinian Territories " => " Palestinian Territories " , " Panama " => " Panama " , " Panama Canal Zone " => " Panama Canal Zone " , " Papua New Guinea " => " Papua New Guinea " , " Paraguay " => " Paraguay " , " People's Democratic Republic of Yemen " => " People's Democratic Republic of Yemen " , " Peru " => " Peru " , " Philippines " => " Philippines " , " Pitcairn Islands " => " Pitcairn Islands " , " Poland " => " Poland " , " Portugal " => " Portugal " , " Puerto Rico " => " Puerto Rico " , " Qatar " => " Qatar " , " Romania " => " Romania " , " Russia " => " Russia " , " Rwanda " => " Rwanda " , " Réunion " => " Réunion " , " Saint Barthélemy " => " Saint Barthélemy " , " Saint Helena " => " Saint Helena " , " Saint Kitts and Nevis " => " Saint Kitts and Nevis " , " Saint Lucia " => " Saint Lucia " , " Saint Martin " => " Saint Martin " , "Saint Pierre and Miquelon" => "Saint Pierre and Miquelon" , "Saint Vincent and the Grenadines" => "Saint Vincent and the Grenadines" , "Samoa" => "Samoa" , "San Marino" => "San Marino" , "Saudi Arabia" => "Saudi Arabia" , "Senegal" => "Senegal" , "Serbia" => "Serbia" , "Serbia and Montenegro" => "Serbia and Montenegro" , "Seychelles" => "Seychelles" , "Sierra Leone" => "Sierra Leone" , "Singapore" => "Singapore" , "Slovakia" => "Slovakia" , "Slovenia" => "Slovenia" , "Solomon Islands" => "Solomon Islands" , "Somalia" => "Somalia" , "South Africa" => "South Africa" , "South Georgia and the South Sandwich Islands" => "South Georgia and the South Sandwich Islands" , "South Korea" => "South Korea" , "Spain" => "Spain" , "Sri Lanka" => "Sri Lanka" , "Sudan" => "Sudan" , "Suriname" => "Suriname" , "Svalbard and Jan Mayen" => "Svalbard and Jan Mayen" , "Swaziland" => "Swaziland" , "Sweden" => "Sweden" , "Switzerland" => "Switzerland" , "Syria" => "Syria" , "São Tomé and Príncipe" => "São Tomé and Príncipe" , "Taiwan" => "Taiwan" , "Tajikistan" => "Tajikistan" , "Tanzania" => "Tanzania" , "Thailand" => "Thailand" , "Timor-Leste" => "Timor-Leste" , "Togo" => "Togo" , "Tokelau" => "Tokelau" , "Tonga" => "Tonga" , "Trinidad and Tobago" => "Trinidad and Tobago" , "Tunisia" => "Tunisia" , "Turkey" => "Turkey" , "Turkmenistan" => "Turkmenistan" , "Turks and Caicos Islands" => "Turks and Caicos Islands" , "Tuvalu" => "Tuvalu" , "U.S. Minor Outlying Islands" => "U.S. Minor Outlying Islands" , "U.S. Miscellaneous Pacific Islands" => "U.S. Miscellaneous Pacific Islands" , "U.S. Virgin Islands" => "U.S. Virgin " , "Uganda" => "Uganda" , "Ukraine" => "Ukraine" , "Union of Soviet Socialist Republics" => "Union of Soviet Socialist Republics" , "United Arab Emirates" => "United Arab Emirates" , "United Kingdom" => "United Kingdom" , "United States" => "United States" , "Unknown or Invalid Region" => "Unknown or Invalid Region" , "Uruguay" => "Uruguay" , "Uzbekistan" => "Uzbekistan" , "Vanuatu" => "Vanuatu" , "Vatican City" => "Vatican City" , "Venezuela" => "Venezuela" , "Vietnam" => "Vietnam" , "Wake Island" => "Wake Island" , "Wallis and Futuna" => "Wallis and Futuna" , "Western Sahara" => "Western Sahara" , "Yemen" => "Yemen" , "Zambia" => "Zambia" , "Zimbabwe" => "Zimbabwe" , "Åland Islands" => "Åland Islands");
							// echo form_dropdown('country',$country,set_value('country'),'class="form-control select2me"') . '</div>';
							?>

							<!-- </div> -->
							<!--/span-->
						<!-- </div> -->
						
                        
                        <!--/row-->
						<div class="row">
                            
                           
                            <div class="col-md-6">
								<div class="form-group">
									<label>Address</label>
									<textarea name="address" class="form-control"><?php echo $values['address'] ?></textarea>
                                </div>
							</div>
						</div>
					
					
					<h3 class="form-section">Employment Details</h3>
                        
						<div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
									<label class="control-label">Employee No.</label>
									<input type="text" name="emp_no" class="form-control" placeholder="Employee No."  value="<?php echo $values['emp_no'] ?>" />
                                </div>
                            </div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
								<label class="control-label">Position</label>
									<input type="text" name="position" class="form-control" placeholder="Position"  value="<?php echo $values['position'] ?>" />
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->

						<div class="row">
                            
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Hire Date</label>
									<input type="date" name="hire_date" class="form-control" placeholder="dd/mm/yyyy"  value="<?php echo $values['hire_date'] ?>" />
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label">SSS</label>
									<input type="text" name="sss" class="form-control" placeholder="SSS"  value="<?php echo $values['sss'] ?>" />
                                </div>
                            </div>
							<!--/span-->
						</div>
						<!--/row-->
						
						<div class="row">
                            
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Philhealth</label>
									<input type="text" name="phil_health" class="form-control" placeholder="Philhealth"  value="<?php echo $values['phil_health'] ?>" />
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
                                <div class="form-group">
                                <label class="control-label">Pag-ibig</label>
                                <input type="text" name="pag_ibig" class="form-control" placeholder="Pag-ibig"  value="<?php echo $values['pag_ibig'] ?>" />
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
										<option <?php ($values['status'] == 'Active' ? "selected=''" : '') ?> value="Active">Active</option>
										<option  <?php ($values['status'] == 'Inactive' ? "selected=''" : '') ?> value="Inactive">Inactive</option>
										<option  <?php ($values['status'] == 'Resign' ? "selected=''" : '') ?> value="Resign">Resign</option>
										<option  <?php ($values['status'] == 'Deceased' ? "selected=''" : '') ?> value="Deceased">Deceased</option>
										</select>
									
									</div>
								</div>
								<!--/span-->
                
							</div>
							<!--/row-->
					</div>
					<div class="form-actions right">
						<button type="submit" class="btn btn-warning"><i class="fa fa-check"></i>Update</button>
              			<button type="button" onclick="window.history.back();" class="btn btn-default">Cancel</button>
						
					</div>
				<?php echo form_close(); ?>
				<!-- END FORM-->
			</div>
		</div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
<?php 
endforeach;
?>
 

