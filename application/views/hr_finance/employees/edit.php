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
                    //echo form_hidden('picture_old',$values['picture']);
                    ?>
					<div class="form-body">
						<div class="lead form-section">Employee Basic Information</div>
                        
						<!-- <div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Upload Picture (jpg,png,gif)</label>
									<input type="file" name="picture" class="form-control"  />
									
								</div>
							</div>
							
						</div> -->

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-sm-3 col-form-label">First Name</label>
									<div class="col-sm-9">
									<input type="text" id="firstName" name="first_name" class="form-control" required="" value="<?php echo $values['first_name'] ?>"  placeholder="First Name"/>
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-3">Date of Birth</label>
									<div class="col-sm-9">
										<input type="date" name="dob" class="form-control" value="<?php echo $values['dob'] ?>" />
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
                        <div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-3 ">Middle Name</label>
									<div class="col-sm-9">
										<input type="text" id="mName" name="middle_name" class="form-control" value="<?php echo $values['middle_name'] ?>"  placeholder="Middle Name" />
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-3">Gender</label>
									<div class="col-sm-9">
										<select class="form-control" name="gender" <?php echo $values['gender'] ?> >
										<option <?php echo ($values['gender'] == "male" ? "selected" : ''); ?> value="male">Male</option>
										<option <?php echo ($values['gender'] == "female" ? "selected" : ''); ?> value="female">Female</option>
										<option <?php echo ($values['gender'] == "other" ? "selected" : ''); ?> value="other">Other</option>
										</select>
									</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						
						<div class="row">
							
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-3">Last Name</label>
									<div class="col-sm-9">
										<input type="text" id="lastName" name="last_name" class="form-control" value="<?php echo $values['last_name'] ?>"  placeholder="Last Name" />
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label col-sm-3">Status</label>
									<div class="col-sm-9">
										<select class="form-control" name="status" <?php echo $values['status'] ?> >
											<option <?php echo ($values['status'] == "M" ? "selected" : ''); ?> >M</option>
											<option <?php echo ($values['status'] == "M1" ? "selected" : ''); ?> >M1</option>
											<option <?php echo ($values['status'] == "M2" ? "selected" : ''); ?> >M2</option>
											<option <?php echo ($values['status'] == "M3" ? "selected" : ''); ?> >M3</option>
											<option <?php echo ($values['status'] == "M4" ? "selected" : ''); ?> >M4</option>
											<option <?php echo ($values['status'] == "M1" ? "selected" : ''); ?> >M1</option>
											<option <?php echo ($values['status'] == "S" ? "selected" : ''); ?> >S</option>
											<option <?php echo ($values['status'] == "S1" ? "selected" : ''); ?> >S1</option>
											<option <?php echo ($values['status'] == "S2" ? "selected" : ''); ?> >S2</option>
											<option <?php echo ($values['status'] == "S3" ? "selected" : ''); ?> >S3</option>
											<option <?php echo ($values['status'] == "S4" ? "selected" : ''); ?> >S4</option>
										</select>
									</div>
                                </div>
                            </div>
							<!--/span-->
							
						</div>
						<!--/row-->
						<div class="lead form-section">Contact Information</div>
						
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								<label class="control-label col-sm-3" for="Contact">Contact No:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="" name="contact" value="<?php echo $values['contact'] ?>"  placeholder="Contact No" />
								</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
								<label class="control-label col-sm-3" for="emergency_contact">Emergency Contact No:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="" name="emergency_contact" value="<?php echo $values['emergency_contact'] ?>"  placeholder="Emergency Contact No" />
								</div>
								</div>
							</div>
							<!--/span-->
						</div>
						<!--/row-->
						
						<div class="row">
							
							<div class="col-md-6">
								<div class="form-group">
                                  <label class="control-label col-sm-3" for="Email">Email:</label>
								  <div class="col-sm-9">
									<input type="email" class="form-control" id="Email" name="email"  value="<?php echo $values['email'] ?>"  placeholder="Email" />
                                	</div>
                                </div>
							</div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-3">Address</label>
									<div class="col-sm-9">
										<textarea name="address" class="form-control"><?php echo $values['address'] ?></textarea>
									</div>
                                </div>
							</div>
						</div>
						<!--/row-->
						<!-- <div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>City</label>
									<input type="text" name="city"  value="<?php echo $values['city'] ?>" class="form-control" />
								</div>
							</div> -->
							<!--/span-->
							<!-- <div class="col-md-6"> -->
								
							<?php 
 
							// echo '<div class="form-group"><label class="control-label for="">Country</label>';

							// $country = array( "" => "Select Country","Afghanistan" => "Afghanistan" , "Albania" => "Albania" , "Algeria" => "Algeria" , "American Samoa" => "American Samoa" , "Andorra" => "Andorra" , "Angola" => "Angola" , "Anguilla" => "Anguilla" , "Antarctica" => "Antarctica" , "Antigua and Barbuda" => "Antigua and Barbuda" , "Argentina" => "Argentina" , "Armenia" => " Armenia " , " Aruba " => " Aruba " , " Australia " => " Australia " , " Austria " => " Austria " , " Azerbaijan " => " Azerbaijan " , " Bahamas " => " Bahamas " , " Bahrain " => " Bahrain " , " Bangladesh " => " Bangladesh " , " Barbados " => " Barbados " , " Belarus " => " Belarus " , " Belgium " => " Belgium " , " Belize " => " Belize " , " Benin " => " Benin " , " Bermuda " => " Bermuda " , " Bhutan " => " Bhutan " , " Bolivia " => " Bolivia " , " Bosnia and Herzegovina " => " Bosnia and Herzegovina " , " Botswana " => " Botswana " , " Bouvet Island " => " Bouvet Island " , " Brazil " => " Brazil " , " British Antarctic Territory " => " British Antarctic Territory " , " British Indian Ocean Territory " => " British Indian Ocean Territory " , " British Virgin Islands " => " British Virgin Islands " , " Brunei " => " Brunei " , " Bulgaria " => " Bulgaria " , " Burkina Faso " => " Burkina Faso " , " Burundi " => " Burundi " , " Cambodia " => " Cambodia " , " Cameroon " => " Cameroon " , " Canada " => " Canada " , " Canton and Enderbury Islands " => " Canton and Enderbury Islands " , " Cape Verde " => " Cape Verde " , " Cayman Islands " => " Cayman Islands " , " Central African Republic " => " Central African Republic " , " Chad " => " Chad " , " Chile " => " Chile " , " China " => " China " , " Christmas Island " => " Christmas Island " , " Cocos [Keeling] Islands " => " Cocos [Keeling] Islands " , " Colombia " => " Colombia " , " Comoros " => " Comoros " , " Congo - Brazzaville " => " Congo - Brazzaville " , " Congo - Kinshasa " => " Congo - Kinshasa " , " Cook Islands " => " Cook Islands " , " Costa Rica " => " Costa Rica " , " Croatia " => " Croatia " , " Cuba " => " Cuba " , " Cyprus " => " Cyprus " , " Czech Republic " => " Czech Republic " , " Côte d’Ivoire " => " Côte d’Ivoire " , " Denmark " => " Denmark " , " Djibouti " => " Djibouti " , " Dominica " => " Dominica " , " Dominican Republic " => " Dominican Republic " , " Dronning Maud Land " => " Dronning Maud Land " , " East Germany " => " East Germany " , " Ecuador " => " Ecuador " , " Egypt " => " Egypt " , " El Salvador " => " El Salvador " , " Equatorial Guinea " => " Equatorial Guinea " , " Eritrea " => " Eritrea " , " Estonia " => " Estonia " , " Ethiopia " => " Ethiopia " , " Falkland Islands " => " Falkland Islands " , " Faroe Islands " => " Faroe Islands " , " Fiji " => " Fiji " , " Finland " => " Finland " , " France " => " France " , " French Guiana " => " French Guiana " , " French Polynesia " => " French Polynesia " , " French Southern Territories " => " French Southern Territories " , " French Southern and Antarctic Territories " => " French Southern and Antarctic Territories " , " Gabon " => " Gabon " , " Gambia " => " Gambia " , " Georgia " => " Georgia " , " Germany " => " Germany " , " Ghana " => " Ghana " , " Gibraltar " => " Gibraltar " , " Greece " => " Greece " , " Greenland " => " Greenland " , " Grenada " => " Grenada " , " Guadeloupe " => " Guadeloupe " , " Guam " => " Guam " , " Guatemala " => " Guatemala " , " Guernsey " => " Guernsey " , " Guinea " => " Guinea " , " Guinea-Bissau " => " Guinea-Bissau " , " Guyana " => " Guyana " , " Haiti " => " Haiti " , " Heard Island and McDonald Islands " => " Heard Island and McDonald Islands " , " Honduras " => " Honduras " , " Hong Kong SAR China " => " Hong Kong SAR China " , " Hungary " => " Hungary " , " Iceland " => " Iceland " , "India" => "India" , " Indonesia " => " Indonesia " , " Iran " => " Iran " , " Iraq " => " Iraq " , " Ireland " => " Ireland " , " Isle of Man " => " Isle of Man " , " Israel " => " Israel " , " Italy " => " Italy " , " Jamaica " => " Jamaica " , " Japan " => " Japan " , " Jersey " => " Jersey " , " Johnston Island " => " Johnston Island " , " Jordan " => " Jordan " , " Kazakhstan " => " Kazakhstan " , " Kenya " => " Kenya " , " Kiribati " => " Kiribati " , " Kuwait " => " Kuwait " , " Kyrgyzstan " => " Kyrgyzstan " , " Laos " => " Laos " , " Latvia " => " Latvia " , " Lebanon " => " Lebanon " , " Lesotho " => " Lesotho " , " Liberia " => " Liberia " , " Libya " => " Libya " , " Liechtenstein " => " Liechtenstein " , " Lithuania " => " Lithuania " , " Luxembourg " => " Luxembourg " , " Macau SAR China " => " Macau SAR China " , " Macedonia " => " Macedonia " , " Madagascar " => " Madagascar " , " Malawi " => " Malawi " , " Malaysia " => " Malaysia " , " Maldives " => " Maldives " , " Mali " => " Mali " , " Malta " => " Malta " , " Marshall Islands " => " Marshall Islands " , " Martinique " => " Martinique " , " Mauritania " => " Mauritania " , " Mauritius " => " Mauritius " , " Mayotte " => " Mayotte " , " Metropolitan France " => " Metropolitan France " , " Mexico " => " Mexico " , " Micronesia " => " Micronesia " , " Midway Islands " => " Midway Islands " , " Moldova " => " Moldova " , " Monaco " => " Monaco " , " Mongolia " => " Mongolia " , " Montenegro " => " Montenegro " , " Montserrat " => " Montserrat " , " Morocco " => " Morocco " , " Mozambique " => " Mozambique " , " Myanmar [Burma] " => " Myanmar [Burma] " , " Namibia " => " Namibia " , " Nauru " => " Nauru " , " Nepal " => " Nepal " , " Netherlands " => " Netherlands " , " Netherlands Antilles " => " Netherlands Antilles " , " Neutral Zone " => " Neutral Zone " , " New Caledonia " => " New Caledonia " , " New Zealand " => " New Zealand " , " Nicaragua " => " Nicaragua " , " Niger " => " Niger " , " Nigeria " => " Nigeria " , " Niue " => " Niue " , " Norfolk Island " => " Norfolk Island " , " North Korea " => " North Korea " , " North Vietnam " => " North Vietnam " , " Northern Mariana Islands " => " Northern Mariana Islands " , " Norway " => " Norway " , " Oman " => " Oman " , " Pacific Islands Trust Territory " => " Pacific Islands Trust Territory " , " Pakistan " => " Pakistan " , " Palau " => " Palau " , " Palestinian Territories " => " Palestinian Territories " , " Panama " => " Panama " , " Panama Canal Zone " => " Panama Canal Zone " , " Papua New Guinea " => " Papua New Guinea " , " Paraguay " => " Paraguay " , " People's Democratic Republic of Yemen " => " People's Democratic Republic of Yemen " , " Peru " => " Peru " , " Philippines " => " Philippines " , " Pitcairn Islands " => " Pitcairn Islands " , " Poland " => " Poland " , " Portugal " => " Portugal " , " Puerto Rico " => " Puerto Rico " , " Qatar " => " Qatar " , " Romania " => " Romania " , " Russia " => " Russia " , " Rwanda " => " Rwanda " , " Réunion " => " Réunion " , " Saint Barthélemy " => " Saint Barthélemy " , " Saint Helena " => " Saint Helena " , " Saint Kitts and Nevis " => " Saint Kitts and Nevis " , " Saint Lucia " => " Saint Lucia " , " Saint Martin " => " Saint Martin " , "Saint Pierre and Miquelon" => "Saint Pierre and Miquelon" , "Saint Vincent and the Grenadines" => "Saint Vincent and the Grenadines" , "Samoa" => "Samoa" , "San Marino" => "San Marino" , "Saudi Arabia" => "Saudi Arabia" , "Senegal" => "Senegal" , "Serbia" => "Serbia" , "Serbia and Montenegro" => "Serbia and Montenegro" , "Seychelles" => "Seychelles" , "Sierra Leone" => "Sierra Leone" , "Singapore" => "Singapore" , "Slovakia" => "Slovakia" , "Slovenia" => "Slovenia" , "Solomon Islands" => "Solomon Islands" , "Somalia" => "Somalia" , "South Africa" => "South Africa" , "South Georgia and the South Sandwich Islands" => "South Georgia and the South Sandwich Islands" , "South Korea" => "South Korea" , "Spain" => "Spain" , "Sri Lanka" => "Sri Lanka" , "Sudan" => "Sudan" , "Suriname" => "Suriname" , "Svalbard and Jan Mayen" => "Svalbard and Jan Mayen" , "Swaziland" => "Swaziland" , "Sweden" => "Sweden" , "Switzerland" => "Switzerland" , "Syria" => "Syria" , "São Tomé and Príncipe" => "São Tomé and Príncipe" , "Taiwan" => "Taiwan" , "Tajikistan" => "Tajikistan" , "Tanzania" => "Tanzania" , "Thailand" => "Thailand" , "Timor-Leste" => "Timor-Leste" , "Togo" => "Togo" , "Tokelau" => "Tokelau" , "Tonga" => "Tonga" , "Trinidad and Tobago" => "Trinidad and Tobago" , "Tunisia" => "Tunisia" , "Turkey" => "Turkey" , "Turkmenistan" => "Turkmenistan" , "Turks and Caicos Islands" => "Turks and Caicos Islands" , "Tuvalu" => "Tuvalu" , "U.S. Minor Outlying Islands" => "U.S. Minor Outlying Islands" , "U.S. Miscellaneous Pacific Islands" => "U.S. Miscellaneous Pacific Islands" , "U.S. Virgin Islands" => "U.S. Virgin " , "Uganda" => "Uganda" , "Ukraine" => "Ukraine" , "Union of Soviet Socialist Republics" => "Union of Soviet Socialist Republics" , "United Arab Emirates" => "United Arab Emirates" , "United Kingdom" => "United Kingdom" , "United States" => "United States" , "Unknown or Invalid Region" => "Unknown or Invalid Region" , "Uruguay" => "Uruguay" , "Uzbekistan" => "Uzbekistan" , "Vanuatu" => "Vanuatu" , "Vatican City" => "Vatican City" , "Venezuela" => "Venezuela" , "Vietnam" => "Vietnam" , "Wake Island" => "Wake Island" , "Wallis and Futuna" => "Wallis and Futuna" , "Western Sahara" => "Western Sahara" , "Yemen" => "Yemen" , "Zambia" => "Zambia" , "Zimbabwe" => "Zimbabwe" , "Åland Islands" => "Åland Islands");
							// echo form_dropdown('country',$country,$values['country'),'class="form-control select2me"') . '</div>';
							?>

							<!-- </div> -->
							<!--/span-->
						<!-- </div> -->
						
                        
                        <!--/row-->
						
						<div class="lead form-section">Employement Details</div>
                        
						<div class="row">
                            
							<div class="col-md-6">
								<div class="form-group">
								<label class="control-label col-sm-3">Position</label>
								<div class="col-sm-9">
									<!-- <input type="text" name="position" class="form-control" placeholder="Position"  value="<?php echo $values['position'] ?>" /> -->
									<?php echo form_dropdown('position_id',$positionsDDL,$values['position_id'],'class="select2me form-control"');?>

								</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label col-sm-3">Employment Status</label>
									<div class="col-sm-9">
										<select class="form-control" name="employment_status">
										<option <?php echo ($values['employment_status'] == "Regular" ? "selected" : ''); ?> value="Regular">Regular</option>
										<option <?php echo ($values['employment_status'] == "Probationary" ? "selected" : ''); ?> value="Probationary">Probationary</option>
										<option <?php echo ($values['employment_status'] == "Extra" ? "selected" : ''); ?> value="Extra">Extra</option>
										<option <?php echo ($values['employment_status'] == "Terminated" ? "selected" : ''); ?> value="Terminated">Terminated</option>
										
									</select>
                                </div>
                                </div>
                            </div>
							<!--/span-->
						</div>
						<!--/row-->

						<div class="row">
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label col-sm-3">Department</label>
									<div class="col-sm-9">
										<input type="text" name="department" class="form-control" placeholder="Department"  value="<?php echo $values['department'] ?>" />
                                </div>
                                </div>
                            </div>
							<!--/span-->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-3">Employement Date</label>
									<div class="col-sm-9">
										<input type="date" name="hire_date" class="form-control" value="<?php echo $values['hire_date'] ?>" />
								</div>
								</div>
							</div>
							<!--/span-->
							
						</div>
						<!--/row-->
						<div class="row">
                            
							<div class="col-md-6">
								<div class="form-group">
								<label class="control-label col-sm-3">Contract</label>
								<div class="col-sm-9">
									<select class="form-control" name="contract" >
										<option <?php echo ($values['contract'] == "Yes" ? "selected" : ''); ?> value="Yes">Yes</option>
										<option <?php echo ($values['contract'] == "No" ? "selected" : ''); ?> value="No">No</option>
										
									</select>
								</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label col-sm-3">Poineer</label>
									<div class="col-sm-9">
										<select class="form-control" name="poineer" >
											<option <?php echo ($values['poineer'] == "Yes" ? "selected" : ''); ?> value="Yes">Yes</option>
											<option <?php echo ($values['poineer'] == "No" ? "selected" : ''); ?> value="No">No</option>
										
										</select>
                                	</div>
                                </div>
                            </div>
							<!--/span-->
						</div>
						<!--/row-->

						<div class="row">
                            
							<div class="col-md-6">
								<div class="form-group">
								<label class="control-label col-sm-3">Regular Working Hours</label>
								<div class="col-sm-9">
									<input type="time" name="working_hour_from" value="<?php echo $values['working_hour_from'] ?>" class="form-control">
									<input type="time" name="working_hour_to" value="<?php echo $values['working_hour_to'] ?>" class="form-control">
								</div>
								</div>
							</div>
							<!--/span-->
							
						</div>
						<!--/row-->

						<div class="lead form-section">Salary & Allowances</div>
						 
						 <div class="row">
							 <div class="col-md-12">
								 <table class="table table-bordered">
									<thead>
										<tr>
											<th>Basic Salary</th>
											<th>Food Allowance</th>
											<th>Transportation Allowance</th>
											<th>Other Allowance</th>
											<th>Monthly Total</th>
										</tr>
									</thead>	
								 	<tbody>
										<tr>
											<th><input type="number" name="basic_salary" id="basic_salary" class="form-control" value="<?php echo $values['basic_salary'] ?>" /></th>
											<th><input type="number" name="food_allow"  id="food_allow"  class="form-control" value="<?php echo $values['food_allow'] ?>" /></th>
											<th><input type="number" name="transportation_allow" id="transportation_allow" class="form-control" value="<?php echo $values['transportation_allow'] ?>" /></th>
											<th><input type="number" name="other_allow" id="other_allow"  class="form-control" value="<?php echo $values['other_allow'] ?>" /></th>
											<th><input type="number" name="monthly_total" id="monthly_total" class="form-control" readonly value="<?php echo $values['monthly_total'] ?>" /></th>
										</tr>
									</tbody>
								 </table>
							 </div>
							 <!--/span-->
						 </div>
						 <!--/row-->

						 <div class="lead form-section">Accounts</div>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-3">BPI Account</label>
									<div class="col-sm-9">
										<input type="text" name="bpi_account" class="form-control" placeholder="BPI Account"  value="<?php echo $values['bpi_account'] ?>" />
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label col-sm-3">TIN</label>
									<div class="col-sm-9">
										<input type="text" name="tin" class="form-control" placeholder="TIN"  value="<?php echo $values['tin'] ?>" />
                               
										</div>
								</div>
                            </div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-3">Card Number</label>
									<div class="col-sm-9">
										<input type="text" name="card_number" class="form-control" placeholder="Card Number"  value="<?php echo $values['card_no'] ?>" />
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label col-sm-3">SSS</label>
									<div class="col-sm-9">
										<input type="text" name="sss" class="form-control" placeholder="SSS"  value="<?php echo $values['sss'] ?>" />
                               
										</div>
								</div>
                            </div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-sm-3">Tracking Number</label>
									<div class="col-sm-9">
										<input type="text" name="tracking_number" class="form-control" placeholder="Tracking Number"  value="<?php echo $values['tracking_no'] ?>" />
									</div>
								</div>
							</div>
							<!--/span-->
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label col-sm-3">PHIC</label>
									<div class="col-sm-9">
										<input type="text" name="phic" class="form-control" placeholder="PHIC"  value="<?php echo $values['phic'] ?>" />
                               
										</div>
								</div>
                            </div>
							<!--/span-->
						</div>
						<!--/row-->
						<div class="row">
                           
							<div class="col-md-6">
                                <div class="form-group">
									<label class="control-label col-sm-3">Pag-ibig</label>
									<div class="col-sm-9">
										<input type="text" name="pag_ibig" class="form-control" placeholder="Pag-ibig"  value="<?php echo $values['pag_ibig'] ?>" />
                               
										</div>
								</div>
                            </div>
							<!--/span-->
							
						</div>
						<!--/row-->
						
						
						<div class="lead form-section">NCR</div>
						 
						<div class="row">
                            <div class="col-md-12">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Date Issued</th>
											<th>Warning Level</th>
											<th>View</th>
											<th>Note</th>
										</tr>
									</thead>	
									<tbody class="ncr_table">
										
									</tbody>
									
								</table>
								<a href="#" class="btn btn-info btn-sm add_new_ncr" name="add_new_ncr">Add New NCR</a>
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
 <script>
   $(document).ready(function() {

      const site_url = '<?php echo site_url($langs); ?>/';
      const path = '<?php echo base_url(); ?>';
      const date = '<?php echo date("Y-m-d") ?>';
	  const emp_id = '<?php echo $emp_id; ?>';

	  let counter = 0; //counter is used for id of the debit / credit textbox to enable and disable 8 textboxs already used so start from 8 here
        $('.add_new_ncr').on('click', function(event) {
            event.preventDefault();
            counter++;
            
            var div = '<tr>' +
                '<td class="text-right"><input type="date" class="form-control ncr_date_issued" id="ncrdateissued_' + counter + '" name="ncr_date_issued[]" autocomplete="off"></td>' +
                '<td class="text-right"><input type="text" class="form-control ncr_warning_level" id="ncrwarninglevel_' + counter + '" name="ncr_warning_level[]" autocomplete="off">' +
                '<td class="text-right"><input type="text" class="form-control description" id="description_' + counter + '" name="description[]" value=""  ></td>' +
                '<td></td></tr>';
            $('.ncr_table').append(div);

    	});
		//$(".add_new_ncr").trigger("click"); //ADD NEW LINE WHEN PAGE LOAD BY DEFAULT


		 ///////////////////
        ////UPDATE PORTION
        //////////////////
        get_ncrs(emp_id);
        //counter = 0;
        function get_ncrs(emp_id)
        {
            //GET SALES 
            $.ajax({
                url: site_url + "hr_finance/C_employees/get_emp_ncr/"+emp_id,
                type: 'GET',
                dataType: "JSON",
                //data: {account_types:account_type},
                dataType: 'json', // added data type
                success: function(data) {
                    console.log(data);
                    $.each(data, function(index, value) {
                        $('#ncr_date_issued').val(value.date_issued);
                        $('#ncr_warning_level').val(value.warning_level);
                        $('#description').val(value.description);
                        
						counter++;
            
						var div = '<tr>' +
							'<td class="text-right"><input type="date" class="form-control ncr_date_issued" id="ncrdateissued_' + counter + '" name="ncr_date_issued[]" value="'+value.date_issued+'" autocomplete="off"></td>' +
							'<td class="text-right"><input type="text" class="form-control ncr_warning_level" id="ncrwarninglevel_' + counter + '" name="ncr_warning_level[]" value="'+value.warning_level+'" autocomplete="off">' +
							'<td class="text-right"><input type="text" class="form-control description" id="description_' + counter + '" name="description[]" value="'+value.description+'" ></td>' +
							'<td></td></tr>';
						$('.ncr_table').append(div);

                    });

                    
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            });
            //////
		}

	  calc_grand_total();

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
            //console.log(parseFloat(grand_total).toFixed(2));
            $('#monthly_total').val(parseFloat(grand_total).toFixed(2));
            
        }
  });
</script>

