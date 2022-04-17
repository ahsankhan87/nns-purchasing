<html lang="en" class="no-js"><!--<![endif]--><!-- BEGIN HEAD --><head>
<meta charset="utf-8">
<title>Login | Kasbook Accounting Software</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Kasbook Accounting Software to run your business, Point of Sale, Accounts Management Systems" name="description">
<meta content="Ahsan khan" name="author">
<meta name="MobileOptimized" content="320">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="<?php echo base_url(); ?>assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/plugins/select2/css/select2.css">
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="<?php echo base_url(); ?>assets/css/style-conquer.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/css/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/css/style-responsive.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="<?php echo base_url(); ?>assets/css/pages/login.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/css/custom.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/css/animate.min.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico">
</head>
<!-- BEGIN BODY -->
<body>
<div class="login">
<!-- BEGIN LOGO -->
<div class="logo animated bounceIn">
	<a href="<?php echo base_url(); ?>">
	<img src="<?php echo base_url(); ?>assets/img/logo.png" alt="">
	</a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content animated bounceIn">
	<!-- BEGIN LOGIN FORM -->
	<form class="login-form" action="<?php echo site_url('C_login/login'); ?>" method="post" novalidate="novalidate">
		<?php
            if($this->session->flashdata('message'))
            {
                echo "<div class='alert alert-success fade in'>";
                echo '<span>'.$this->session->flashdata('message').'</span>';
                echo '</div>';
            }
            if($this->session->flashdata('errors'))
            {
                echo "<div class='alert alert-danger fade in'>";
                echo '<span>'. $this->session->flashdata('errors').'</span>';
                echo "</div>";
            }
            
            
        ?>
        <div id="success-msg" class="alert alert-success display-hide">
			<button class="close" data-close="alert"></button>
			<?php echo 'Account Created successfully'; ?>
		</div>
		<h3>Google Authentication </h3>
        <h4 class="form-title">Please enter the 6 digits verification code</h4>
		<div class="alert alert-danger display-hide">
			<button class="close" data-close="alert"></button>
			<span>Enter Verification code </span>
		</div>
       
       <!-- <div class="form-group">
			ie8, ie9 does not support html5 placeholder, so we just show field title for that
			<label class="control-label visible-ie8 visible-ie9">Role</label>
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<select class="form-control" name="role">
                    <option value="admin">&nbsp;&nbsp;&nbsp;&nbsp;Administrator</option>
                    <option value="emp">&nbsp;&nbsp;&nbsp;&nbsp;Employee</option>
                </select>
			</div>
		</div>-->
        <div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">Two-factor Token</label>
			<div class="input-icon">
				<i class="fa fa-code"></i>
				<input class="form-control placeholder-no-fix" type="number" maxlength="6" autofocus="" autocomplete="off" placeholder="XXXXXX" name="token">
			</div>
		</div>
		<div class="form-actions">
			<label class="checkbox">
			<!-- <div class="checker"><span><input type="checkbox" name="remember" value="1"></span></div> Remember me </label> -->
			<button type="submit" class="btn btn-info pull-right">
			Let me in </button>
		</div>
        
		<!-- <div class="forget-password">
			<h4>Forgot your password ?</h4>
			<p>
				 no worries, click <a href="javascript:;" id="forget-password">here</a>
				to reset your password.
			</p>
		</div> 
		<div class="create-account">
			<p>
				 Don't have an account yet ?&nbsp; <a href="javascript:;" id="register-btn">Create an account</a>
			</p>
		</div>
        -->
	</form>
	<!-- END LOGIN FORM -->
</div>

<!-- BEGIN COPYRIGHT -->
<div class="copyright">
	 <?php echo date("Y"); ?> &copy; kasbook.com
</div>
</div><!-- END LOGIN -->

<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<script async="" src="//www.google-analytics.com/analytics.js"></script><script src="<?php echo base_url(); ?>assets/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="<?php echo base_url(); ?>assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<?php echo base_url(); ?>assets/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/plugins/select2/js/select2.min.js"></script>

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!-- END JAVASCRIPTS -->
<script src="<?php echo base_url(); ?>assets/scripts/app.js" type="text/javascript"></script>
<!-- <script src="<?php echo base_url(); ?>assets/scripts/login.js" type="text/javascript"></script> -->

 
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() { 
  
  var site_url = '<?php echo site_url(); ?>';
  var base_url = '<?php echo base_url(); ?>';
    
// console.log(site_url);

///////////////////////////////////////
   // $('.login').hide();
    
   // $('.key').on('click',function(){
        
          //var key = prompt("Please enter your key", "Secret Key");
         // if (key == 1234) {
          //  $('.login').show();
           // $('.landing_page').hide();
         // }
        
   // })
///////////////////////////////////

  App.init();
//   Login();
            handleLogin();
            handleForgetPassword();
            handleRegister(); 
  var action = location.hash.substr(1);
          if (action == 'createaccount') {
              $('.register-form').show();
              $('.login-form').hide();
              $('.forget-form').hide();
          } else if (action == 'forgetpassword')  {
              $('.register-form').hide();
              $('.login-form').hide();
              $('.forget-form').show();
          }

   
    function handleLogin() {
		$('.login-form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	                token: {
	                    required: true
	                }
	            },

	            messages: {
	                token: {
	                    required: "Verification code is required1."
	                }
	                
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-danger', $('.login-form')).show();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                form.submit();
	            }
	        });

	        $('.login-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.login-form').validate().form()) {
	                    $('.login-form').submit();
	                }
	                return false;
	            }
	        });
	}

	function handleForgetPassword() {
		$('.forget-form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                email: {
	                    required: true,
	                    email: true
	                }
	            },

	            messages: {
	                email: {
	                    required: "Email is required."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                form.submit();
	            }
	        });

	        $('.forget-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.forget-form').validate().form()) {
	                    $('.forget-form').submit();
	                }
	                return false;
	            }
	        });

	        jQuery('#forget-password').click(function () {
	            jQuery('.login-form').hide();
	            jQuery('.forget-form').show();
	        });

	        jQuery('#back-btn').click(function () {
	            jQuery('.login-form').show();
	            jQuery('.forget-form').hide();
	        });

	}

	function handleRegister() {
        //console.log(site_url);
        
		function format(state) {
            if (!state.id) return state.text; // optgroup
            return "<img class='flag' src='assets/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
        }


		$("#select2_sample4").select2({
		  	placeholder: '<i class="fa fa-map-marker"></i>&nbsp;Select a Country',
            allowClear: true,
            formatResult: format,
            formatSelection: format,
            escapeMarkup: function (m) {
                return m;
            }
        });


			$('#select2_sample4').change(function () {
                $('.register-form').validate().element($(this)); //revalidate the chosen dropdown value and show error or success message for the input
            });
		
		var url      = window.location.origin;
		$.validator.addMethod("checkUsername", 
            function(value, element) {
                var result = false;
                $.ajax({
                    type:"POST",
                    async: false,
                    url  : site_url+'/en/companies/C_newStore/checkUsername', // script to validate in server side
                    data : $("#u_name").serialize(),
                    success: function(data) {
                        //console.log(data);
                        result = (data == 'true' ? false : true);
                        
                        //console.log($("#u_name").serialize());
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus, errorThrown);
                    }
                });
                // return true if username is exist in database
                //console.log(result);
                return result; 
            }, 
            "This username is already taken! Try another."
        );
    
        var success1 = $('.alert-success');
        $("#register-submit-btn").show();
        $(".loading").hide();
                    
         $('.register-form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                
	                name: {
	                    required: true
	                },
	                email: {
	                    required: true,
	                    email: true
	                },
	                address: {
	                    required: true
	                },
	                time_zone: {
	                    required: true
	                },
	                currency_id: {
	                    required: true
	                },
                    
                    contact_no:{
                        required:true
                    },
                    fy_start_date:{
                        required:true
                    },
                    fy_end_date:{
                        required:true
                    },
                    fy_year:{
                        required:true
                    },
	                u_name: {
	                    required: true,
                        minlength: 3,
                        maxlength:12,
                        checkUsername:true
                        //remote: {  // value of 'username' field is sent by default
//                            type: 'POST',
//                            url: 'http://localhost/khybersoft/pos1/en/companies/C_companies/hasLoginUsername'
//                        }
	                },
                    role: {
	                    required: true
	                },
	                password: {
	                    required: true,
                        minlength: 3,
                        maxlength:12,
	                },
	                rpassword: {
	                   minlength: 3,
                        maxlength:12,
	                    equalTo: "#register_password"
	                },

	                tnc: {
	                    required: true
	                }
	            },

	            messages: { // custom messages for radio buttons and checkboxes
	                tnc: {
	                    required: "Please accept TNC first."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
                    $("#register-submit-btn").show();
                    $(".loading").hide();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                if (element.attr("name") == "tnc") { // insert checkbox errors after the container                  
	                    error.insertAfter($('#register_tnc_error'));
	                } else if (element.closest('.input-icon').size() === 1) {
	                    error.insertAfter(element.closest('.input-icon'));
	                } else {
	                	error.insertAfter(element);
	                }
	            },

	            submitHandler: function (form) {
	               
                   $("#register-submit-btn").hide();
                   $(".loading").show();
	               
                    $.ajax({
            				type : 'POST',
            				url  : $('#url').val(),
            				data : $('.register-form').serialize(),
                            success : function(data)
            						  {
            						      console.log($('#url').val());
    						              $("#success-msg").show();
                                          $("#register-submit-btn").show();
                                          $(".loading").hide();  
                                          jQuery('.register-form').hide();
                                          jQuery('.login-form').show();
                                          
                                          console.log(data);
                                          //window.location.href = $('#url').val();
            					      },
                            error: function (request, status, error) {
                                        console.log(request);
                                        console.log(error);
                                    }
            				});
                    return false; // required to block normal submit since you used ajax
        
	            }
	        });

			$('.register-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.register-form').validate().form()) {
	                    $('.register-form').submit();
	                }
	                return false;
	            }
	        });

	        jQuery('#register-btn').click(function () {
	            jQuery('.login-form').hide();
	            jQuery('.register-form').show();
                //alert('You are not a premuim user. please contact the vendor');
	        });

	        jQuery('#register-back-btn').click(function () {
	            jQuery('.login-form').show();
	            jQuery('.register-form').hide();
	        });
	}
    
    


});
</script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=all" rel="stylesheet" type="text/css">

<!-- END BODY -->
<span role="status" aria-live="polite" class="select2-hidden-accessible"></span></body></html>