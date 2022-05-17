<?php //if (substr_count($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip')) ob_start("ob_gzhandler"); else ob_start(); 
?>

<html lang="en" class="no-js" ng-app="myApp"><!--<![endif]--><!-- BEGIN HEAD --><head>
<meta charset="utf-8">
<title><?php echo $title; ?> | Kasbook Accounting Software</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Kasbook Accounting Software, E-Accountant, Point of Sales, invoicing" name="description">
<meta content="Ahsan Khan" name="author">
<meta name="MobileOptimized" content="320">

<?php $url1 = $this->uri->segment(1);
      $url2 = $this->uri->segment(2);
      $url3 = $this->uri->segment(3);
      $url4 = $this->uri->segment(4); ?>

<script src="<?php echo base_url(); ?>assets/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>

<!-- Angular JS-->
<script> var site_url = '<?php echo site_url($langs); ?>';
var path = '<?php echo base_url(); ?>';</script>

<script src="<?php echo base_url() ?>js/angular/lib/angular.min.js"></script>

<!-- custom Angular JS-->
<script src="<?php echo base_url() ?>js/angular/myapp.js"></script>
<!--<script src="<?php echo base_url() ?>js/angular/trans/salesCtrl.js"></script>-->
<!--<script src="<?php echo base_url() ?>js/angular/trans/editSalesCtrl.js"></script>-->
<script src="<?php echo base_url() ?>js/angular/trans/purchaseCtrl.js"></script>
<script src="<?php echo base_url() ?>js/angular/trans/editpurchaseCtrl.js"></script>
<!--<script src="<?php echo base_url() ?>js/angular/trans/purchaseordersCtrl.js"></script>-->
<!--<script src="<?php echo base_url() ?>js/angular/trans/expenseCtrl.js"></script>-->
<!--<script src="<?php echo base_url() ?>js/angular/trans/estimateCtrl.js"></script>-->
<!--<script src="<?php echo base_url() ?>js/angular/productsCtrl.js"></script>-->
<!--<script src="<?php echo base_url() ?>js/angular/customersCtrl.js"></script>-->
<script src="<?php echo base_url() ?>js/angular/suppliersCtrl.js"></script>
<!--<script src="<?php echo base_url() ?>js/angular/entriesCtrl.js"></script>-->

<!-- END GLOBAL MANDATORY STYLES -->
<link href="<?php echo base_url(); ?>assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<script src="<?php echo base_url(); ?>assets/plugins/charts/Chart.min.js"></script>

<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN THEME STYLES -->
<?php if($url1 == 'en' || $url1 == '' || $url1 == 'it'){ ?>
<link href="<?php echo base_url(); ?>assets/css/custom.css" rel="stylesheet" type="text/css">
 <link href="<?php echo base_url(); ?>assets/css/style.css" rel="stylesheet" type="text/css">
 <link href="<?php echo base_url(); ?>assets/css/style-responsive.css" rel="stylesheet" type="text/css">
 <link href="<?php echo base_url(); ?>assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="<?php echo base_url(); ?>assets/css/style-conquer.css" rel="stylesheet" type="text/css">
<?php } ?>

<?php if($url1 == 'ur' || $url1 == 'ar'){ ?>
<link href="<?php echo base_url(); ?>assets/css/ur/custom_ur.css" rel="stylesheet" type="text/css">
 <link href="<?php echo base_url(); ?>assets/css/ur/style_ur.css" rel="stylesheet" type="text/css">
 <link href="<?php echo base_url(); ?>assets/css/ur/style-responsive_ur.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/css/ur/default_ur.css" rel="stylesheet" type="text/css" id="style_color">
<link href="<?php echo base_url(); ?>assets/css/ur/style-conquer_ar.css" rel="stylesheet" type="text/css">
<?php } ?>
    
<link href="<?php echo base_url(); ?>assets/css/animate.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url(); ?>assets/plugins/toastr/toastr.min.css" rel="stylesheet" type="text/css">

<link rel="shortcut icon" href="<?php echo base_url(); ?>assets/img/favicon.ico">

<!-- END THEME STYLES 
<link rel="shortcut icon" href="favicon.ico">
<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style>
-->
<?php if($this->db->dbdriver !== 'sqlite3'){ ?>
<!-- Global site tag (gtag.js) - Google Analytics 
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-120969945-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-120969945-1');
</script>
-->
<?php } ?>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
   
<?php ($url3 == "C_sales" || $url3=="C_receivings" || $url3=="C_samples" || $url3=="Items" ? $sidebar=" page-sidebar-fixed page-sidebar-closed" : $sidebar="");
      ($url1 == "ur" || $url1 == 'ar' ? $sidebar.=" page-sidebar-reversed" : $sidebar.="");  
 ?>
<body class="page-header-fixed <?php echo $sidebar; ?> animated fadeIn"  style="">

<!-- BEGIN HEADER -->
<div class="header navbar navbar-fixed-top">
	<!-- BEGIN TOP NAVIGATION BAR -->
	<div class="header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
            <a href="<?php echo site_url('Dashboard'); ?>">
                <img src="<?php echo base_url(); ?>assets/img/logo.png" alt="logo">
            </a>
        </div>
        
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<img src="<?php echo base_url(); ?>assets/img/menu-toggler.png" alt="">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<ul class="nav navbar-nav pull-right">
			<li class="devider">
				 &nbsp;
			</li>
			<!-- BEGIN USER LOGIN DROPDOWN 
            <?php //if($_SESSION['user_id'] > 0){ ?>
            <li class="dropdown user">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
				<img alt="" src="<?php echo base_url(); ?>assets/img/avatar3_small.jpg">
				<span class="username username-hide-on-mobile"><?php echo $_SESSION['full_name']; ?> </span>
				<i class="fa fa-angle-down"></i>
				</a>
				<ul class="dropdown-menu">
					<li>
						<a href="<?php echo site_url('C_employee/empDetail'); ?>"><i class="fa fa-user"></i> My Profile</a>
					</li>
                    <li class="divider">
					</li>
					<li>
						<a href="<?php echo site_url('c_login/logout') ?>"><i class="fa fa-key"></i> Log Out</a>
					</li>
				</ul>
			</li>
            
            <?php //} else { ?>
            -->
            <li class="dropdown language">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
				<img alt="" src="<?php echo base_url(); ?>assets/img/flags/<?php echo $url1;?>.png">
				<span class="username"><?php echo strtoupper($url1); ?> </span>
				<i class="fa fa-angle-down"></i>
				</a>
				<ul class="dropdown-menu">
					<li>
						<a href="<?php echo base_url(); ?>ar<?php echo substr($this->uri->uri_string(),2); ?>"  ><img alt="" src="<?php echo base_url(); ?>assets/img/flags/ar.png"> Arabic</a>
					</li>
                    <li>
                    	<a href="<?php echo base_url(); ?>en<?php echo substr($this->uri->uri_string(),2); ?>" ><img alt="" src="<?php echo base_url(); ?>assets/img/flags/en.png"> English</a>
                    </li>
					<li>
                    	<a href="<?php echo base_url(); ?>it<?php echo substr($this->uri->uri_string(),2); ?>" ><img alt="" src="<?php echo base_url(); ?>assets/img/flags/it.png"> Italian</a>
                    </li>
                    <li>
						<a href="<?php echo base_url(); ?>ur<?php echo substr($this->uri->uri_string(),2); ?>"  ><img alt="" src="<?php echo base_url(); ?>assets/img/flags/ur.png"> Urdu</a>
					</li>
                    
				</ul>
			</li>
			<li class="dropdown user">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
				<!--<img alt="" src="<?php echo base_url(); ?>assets/img/avatar3_small.jpg">-->
				<span class="username username-hide-on-mobile company_name"><?php echo $_SESSION['company_name'];  ?> </span>
				<i class="fa fa-angle-down"></i>
				</a>
				<ul class="dropdown-menu">
					<li>
						<a href="<?php echo site_url('companies/c_company'); ?>"><i class="fa fa-user"></i> My Profile</a>
					</li>
                    <?php if($_SESSION['role'] == 'admin'){ ?>
                    <li>
						<a href="<?php echo site_url('users/C_users'); ?>"><i class="fa fa-tasks"></i> Users</a>
					</li>
                    <?php } ?>
                    <li>
						<a href="<?php echo site_url('setting/C_fyear'); ?>"><i class="fa fa-tasks"></i> Fiscal Year</a>
					</li>
					<li>
					<!--	<a href="<?php echo site_url('setting/PostingTypes'); ?>"><i class="fa fa-tasks"></i> Customer Account Posting</a>-->
					<!--</li>-->
     <!--               <li>-->
					<!--	<a href="<?php echo site_url('setting/PostingTypes/purchasePostingTypes'); ?>"><i class="fa fa-tasks"></i> Supplier Account Posting </a>-->
					<!--</li>-->
     <!--               <li>-->
					<!--	<a href="<?php echo site_url('setting/C_taxes'); ?>"><i class="fa fa-tasks"></i> Taxes</a>-->
					<!--</li>-->
     <!--               <li>-->
					<!--	<a href="<?php echo site_url('setting/C_currencies'); ?>"><i class="fa fa-tasks"></i> Currencies</a>-->
					<!--</li>-->
                    <!--<li class="divider">-->
                   <?php if($_SESSION['role'] == 'admin'){ ?>
                   <li>
                        <?php if($this->db->dbdriver === 'sqlite3')
                            //   {
                            //     echo '<a href="'.site_url('Dbbackup/sqlitedb_backup') .'" onclick="return confirm(\'Are you sure you want to download database backup?\')"><i class="fa fa-key"></i> Download DB3 Backup</a>';
                            //   }else if($this->db->dbdriver === 'mysqli')
                            //   {
                            //     echo '<a href="'. site_url('setting/Dbbackup') .'" onclick="return confirm(\'Are you sure you want to download database backup?\')"><i class="fa fa-key"></i> Download DB Backup</a>';
                            //   }  
                        ?>
						
					<!--</li>-->
                    
     <!--               <li>-->
					<!--	<a href="<?php echo site_url('setting/C_logs') ?>"><i class="fa fa-key"></i> Logs</a>-->
                        
					<!--</li>-->
                    <?php } ?>
					</li>
					<li>
						<a href="<?php echo site_url('C_login/logout') ?>"><i class="fa fa-key"></i> Log Out</a>
					</li>
				</ul>
			</li>
            <?php //} ?>
			<!-- END USER LOGIN DROPDOWN -->
		</ul>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="clearfix"></div>

<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<!-- DOC: for circle icon style menu apply page-sidebar-menu-circle-icons class right after sidebar-toggler-wrapper -->
			<ul class="page-sidebar-menu">
				<li class="sidebar-toggler-wrapper">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler">
					</div>
					<div class="clearfix">
					</div>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="sidebar-search-wrapper">
					<form class="search-form" role="form" action="" method="get">
						<div class="input-icon right">
							<i class="icon-magnifier"></i>
							<input type="text" class="form-control" name="query" placeholder="Search...">
						</div>
					</form>
				</li>
                
			    <li <?php echo ($url2 == 'Dashboard' || $url2 == 'pos' || $url2 == 'trans' || $url2 == 'reports' ? "class='active'" : '') ?>>
					<a href="javascript:;">
					<i class="icon-plus"></i>
					<span class="title">Purchasing</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
					    <li <?php echo ($url2 == 'Dashboard' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('Dashboard/C_dashboard') ?>"><i class="icon-home"></i> Dashboard</a>
					    </li>
						<li <?php echo ($url2 == 'pos' ? "class='active'" : '') ?>>
							<a href="javascript:;">
							<i class="fa fa-list"></i> Menu <span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<!--<li>-->
								<!--	<a href="javascript:;">-->
								<!--	<i class="icon-user"></i>-->
								<!--	Sample Link 1 <span class="arrow"></span>-->
								<!--	</a>-->
								<!--	<ul class="sub-menu">-->
								<!--		<li>-->
								<!--			<a href="#"><i class="icon-wrench"></i> Sample Link 1</a>-->
								<!--		</li>-->
								<!--		<li>-->
								<!--			<a href="#"><i class="icon-ban"></i> Sample Link 1</a>-->
								<!--		</li>-->
								<!--		<li>-->
								<!--			<a href="#"><i class="icon-check"></i> Sample Link 1</a>-->
								<!--		</li>-->
								<!--	</ul>-->
								<!--</li>-->
								<li <?php echo ($url3 == 'C_categories' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('pos/C_categories') ?>"><i class="icon-question"></i> Categories</a>
								</li>
								<li <?php echo ($url3 == 'C_suppliers' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('pos/C_suppliers') ?>"><i class="icon-rocket"></i> Suppliers</a>
								</li>
								<li <?php echo ($url3 == 'Items' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('pos/Items') ?>"><i class="icon-tag"></i> Products</a>
								</li>
								<li <?php echo ($url3 == 'C_units' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('pos/C_units') ?>"><i class="icon-tag"></i> Units</a>
								</li>
								<li <?php echo ($url3 == 'C_shipping_terms' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('pos/C_shipping_terms') ?>"><i class="icon-tag"></i> Shipping Terms</a>
								</li>
							</ul>
						</li>
						<li <?php echo ($url2 == 'trans' ? "class='active'" : '') ?>>
							<a href="javascript:;">
							<i class="fa fa-exchange"></i> Purchases <span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li <?php echo ($url3 == 'C_receivings' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('trans/C_receivings/allPurchases') ?>"><i class="icon-graph"></i> Purchases</a>
								</li>
								<li <?php echo ($url3 == 'C_samples' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('trans/C_samples') ?>"><i class="icon-share"></i> Samples</a>
								</li>
								<li <?php echo ($url3 == 'C_sourcing' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('trans/C_sourcing') ?>"><i class="icon-settings"></i> Sourcing</a>
								</li>
								<li <?php echo ($url3 == 'C_logistics_fees' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('trans/C_logistics_fees') ?>"><i class="icon-tag"></i> Logistics Fees</a>
								</li>
								<li <?php echo ($url3 == 'C_claims' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('trans/C_claims') ?>"><i class="icon-tag"></i> Claims</a>
								</li>
								<li <?php echo ($url3 == 'C_incomingProducts' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('trans/C_incomingProducts') ?>"><i class="icon-tag"></i> Incoming Products</a>
								</li>
								<li <?php echo ($url3 == 'C_purchase_requests' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('trans/C_purchase_requests') ?>"><i class="icon-tag"></i> Purchase Requests</a>
								</li>
								
							</ul>
						</li>
						<li <?php echo ($url2 == 'reports' ? "class='active'" : '') ?>>
							<a href="javascript:;">
							<i class="fa fa-bar-chart-o fa"></i> Reports <span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li <?php echo ($url3 == 'C_receivingsreport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('reports/C_receivingsreport') ?>"><i class="icon-graph"></i> Purchase Report</a>
								</li>
								<li <?php echo ($url3 == 'C_categoryReport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('reports/C_categoryReport') ?>"><i class="icon-share"></i> Category Report</a>
								</li>
								<li <?php echo ($url3 == 'C_volumeReport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('reports/C_volumeReport') ?>"><i class="icon-settings"></i> Volume Report</a>
								</li>
								<li <?php echo ($url3 == 'C_logisticsReport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('reports/C_logisticsReport') ?>"><i class="icon-tag"></i> Logistics Fee Report</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li <?php echo ($url2 == 'production' ? "class='active'" : '') ?>>
					<a href="javascript:;">
					<i class="icon-present"></i>
					<span class="title">Production</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
					    <!--<li <?php echo ($url2 == 'production' ? "class='active'" : '') ?>>-->
					    <!--    <a href="<?php echo site_url('production/C_dashboard') ?>"><i class="icon-home"></i> Dashboard</a>-->
					    <!--</li>-->
						
						<li <?php echo ($url3 == 'C_production_schedule' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('production/C_production_schedule') ?>"><i class="icon-time"></i> Production Schedule</a>
					    </li>
						
						<li <?php echo ($url3 == 'C_production_request' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('production/C_production_request') ?>"><i class="icon-time"></i> Production Request</a>
					    </li>
						
						<li <?php echo ($url3 == 'C_products' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('production/C_products') ?>"><i class="icon-time"></i> Products</a>
					    </li>
					    
						<li <?php echo ($url3 == 'C_customers' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('production/C_customers') ?>"><i class="icon-time"></i> Customers</a>
					    </li>
						
						<li <?php echo ($url3 == 'C_production_history' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('production/C_production_history') ?>"><i class="icon-time"></i> Production History</a>
					    </li>
						
					</ul>
				</li>
				<li <?php echo ($url2 == 'rd' ? "class='active'" : '') ?>>
					<a href="javascript:;">
					<i class="icon-present"></i>
					<span class="title">R&D</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
					    
						<li <?php echo ($url3 == 'C_samples_request' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('rd/C_samples_request') ?>"><i class="icon-time"></i> Samples Request</a>
					    </li>
						
						<li <?php echo ($url3 == 'C_samples_schedule' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('rd/C_samples_schedule') ?>"><i class="icon-time"></i> Samples Schedule</a>
					    </li>
					    
						<li <?php echo ($url3 == 'C_rd_history' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('rd/C_rd_history') ?>"><i class="icon-time"></i> R&D History</a>
					    </li>
						
						
					</ul>
				</li>
				<li <?php echo ($url2 == 'farm' ? "class='active'" : '') ?>>
					<a href="javascript:;">
					<i class="icon-present"></i>
					<span class="title">Farm</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
					    <!--<li <?php echo ($url2 == 'production' ? "class='active'" : '') ?>>-->
					    <!--    <a href="<?php echo site_url('Dashboard/C_dashboard') ?>"><i class="icon-home"></i> Dashboard</a>-->
					    <!--</li>-->
						
						<li <?php echo ($url3 == 'C_grinding' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('farm/C_grinding') ?>"><i class="icon-time"></i> Grinding</a>
					    </li>
						
						<li <?php echo ($url3 == 'C_harvest' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('farm/C_harvest') ?>"><i class="icon-time"></i> Harvest</a>
					    </li>
						
						<li <?php echo ($url3 == 'C_feeding' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('farm/C_feeding') ?>"><i class="icon-time"></i> Feeding</a>
					    </li>
						
						<li <?php echo ($url3 == 'C_inventory' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('farm/C_inventory') ?>"><i class="icon-time"></i> Inventory</a>
					    </li>
					    
					    <li <?php echo ($url3 == 'C_inventory_history' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('farm/C_inventory_history') ?>"><i class="icon-time"></i> Inventory History</a>
					    </li>
					    
					    <li <?php echo ($url3 == 'farmReports' ? "class='active'" : '') ?>>
							<a href="javascript:;">
							<i class="fa fa-bar-chart-o fa"></i> Reports <span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li <?php echo ($url4 == 'C_feedingReport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('farm/farmReports/C_feedingReport') ?>"><i class="icon-graph"></i> Feeding Report</a>
								</li>
								<li <?php echo ($url4 == 'C_harvestReport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('farm/farmReports/C_harvestReport') ?>"><i class="icon-share"></i> Harvest Report</a>
								</li>
								<li <?php echo ($url4 == 'C_grindingReport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('farm/farmReports/C_grindingReport') ?>"><i class="icon-settings"></i> Grinding Report</a>
								</li>
								
							</ul>
						</li>
					</ul>
				</li>
				<li <?php echo ($url2 == 'hr_finance' ? "class='active'" : '') ?>>
					<a href="javascript:;">
					<i class="icon-present"></i>
					<span class="title">HR & Finance</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
					    
						<li <?php echo ($url3 == 'C_sales' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('hr_finance/C_sales/allSales') ?>"><i class="fa fa-bar-chart-o fa"></i> Sales</a>
					    </li>
						
					    <li <?php echo ($url3 == 'C_expenses' || $url3 == 'C_paymentFor' || $url3 == 'C_paymentMethod' || $url3 == 'C_expenseItems' || $url3 == 'C_expenseSubCategory' ? "class='active'" : '') ?>>
							<a href="javascript:;">
							<i class="fa fa-bar-chart-o fa"></i> Expenses <span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li <?php echo ($url4 == 'allExpenses' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('hr_finance/C_expenses/allExpenses') ?>"><i class="icon-share"></i> All Expenses</a>
								</li>
								<li <?php echo ($url3 == 'C_expenseItems' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('hr_finance/C_expenseItems/') ?>"><i class="icon-settings"></i> Items</a>
								</li>
								<li <?php echo ($url3 == 'C_paymentFor' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('hr_finance/C_paymentFor') ?>"><i class="icon-graph"></i> Payment For</a>
								</li>
								<li <?php echo ($url3 == 'C_paymentMethod' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('hr_finance/C_paymentMethod') ?>"><i class="icon-share"></i> Payment Method</a>
								</li>
								<li <?php echo ($url3 == 'C_expenseSubCategory' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('hr_finance/C_expenseSubCategory/') ?>"><i class="icon-settings"></i> Sub Category</a>
								</li>
								
							</ul>
						</li>
						
						<!-- <li <?php echo ($url3 == 'C_feeding' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('farm/C_feeding') ?>"><i class="icon-time"></i> OT Tracking</a>
					    </li> -->
						
						<li <?php echo ($url3 == 'C_employees' ? "class='active'" : '') ?>>
					        <a href="<?php echo site_url('hr_finance/C_employees') ?>"><i class="icon-time"></i> Employee Masterfile</a>
					    </li>
					    
					    <!-- <li <?php echo ($url3 == 'farmReports' ? "class='active'" : '') ?>>
							<a href="javascript:;">
							<i class="fa fa-bar-chart-o fa"></i> Reports <span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li <?php echo ($url4 == 'C_feedingReport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('farm/farmReports/C_feedingReport') ?>"><i class="icon-graph"></i> Feeding Report</a>
								</li>
								<li <?php echo ($url4 == 'C_harvestReport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('farm/farmReports/C_harvestReport') ?>"><i class="icon-share"></i> Harvest Report</a>
								</li>
								<li <?php echo ($url4 == 'C_grindingReport' ? "class='active'" : '') ?>>
									<a href="<?php echo site_url('farm/farmReports/C_grindingReport') ?>"><i class="icon-settings"></i> Grinding Report</a>
								</li>
								
							</ul>
						</li> -->
					</ul>
				</li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
    <div class="page-content" style="min-height:540px">
        
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title">Modal title</h4>
						</div>
						<div class="modal-body">
							 Widget settings form goes here
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success">Save changes</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- BEGIN STYLE CUSTOMIZER 
			<div class="theme-panel hidden-xs hidden-sm">
				<div class="toggler">
					<i class="fa fa-gear"></i>
				</div>
				<div class="theme-options">
					<div class="theme-option theme-colors clearfix">
						<span>
						Theme Color </span>
						<ul>
							<li class="color-black current color-default tooltips" data-style="default" data-original-title="Default">
							</li>
							<li class="color-grey tooltips" data-style="grey" data-original-title="Grey">
							</li>
							<li class="color-blue tooltips" data-style="blue" data-original-title="Blue">
							</li>
							<li class="color-red tooltips" data-style="red" data-original-title="Red">
							</li>
							<li class="color-light tooltips" data-style="light" data-original-title="Light">
							</li>
						</ul>
					</div>
					<div class="theme-option">
						<span>
						Layout </span>
						<select class="layout-option form-control input-small">
							<option value="fluid" selected="selected">Fluid</option>
							<option value="boxed">Boxed</option>
						</select>
					</div>
					<div class="theme-option">
						<span>
						Header </span>
						<select class="header-option form-control input-small">
							<option value="fixed" selected="selected">Fixed</option>
							<option value="default">Default</option>
						</select>
					</div>
					<div class="theme-option">
						<span>
						Sidebar </span>
						<select class="sidebar-option form-control input-small">
							<option value="fixed">Fixed</option>
							<option value="default" selected="selected">Default</option>
						</select>
					</div>
					<div class="theme-option">
						<span>
						Sidebar Position </span>
						<select class="sidebar-pos-option form-control input-small">
							<option value="left" selected="selected">Left</option>
							<option value="right">Right</option>
						</select>
					</div>
					<div class="theme-option">
						<span>
						Footer </span>
						<select class="footer-option form-control input-small">
							<option value="fixed">Fixed</option>
							<option value="default" selected="selected">Default</option>
						</select>
					</div>
				</div>
			</div>
            -->
            
			<!-- END BEGIN STYLE CUSTOMIZER -->
			<!-- BEGIN PAGE HEADER-->
			<h3 class="page-title">
			<?php echo $main ?> <small><?php echo @$main_small; ?></small>
			</h3>
			<div class="page-bar">
				<ul class="page-breadcrumb">
					<li>
						<a href="<?php echo site_url('Dashboard/C_dashboard'); ?>"><i class="fa fa-home"></i></a>
						<?php echo ucfirst($this->uri->segment(2));?>
                        <?php if($this->uri->segment(3)){ ?>
						<i class="fa fa-angle-<?php echo ($langs=='en'?'right':'left'); ?>"></i>
                        <?php } ?>
					</li>
					<li>
						<!--<a href="<?php echo site_url($this->uri->segment(2).'/'.$this->uri->segment(3)); ?>"><?php echo ucfirst(substr($this->uri->segment(3),2,30));?></a>-->
                         <?php if($this->uri->segment(3) == 'Items'){ 
                             echo 'Products';
                         }else{
                             echo ucfirst(substr($this->uri->segment(3),2,30));
                         }
                         ?>
                        <?php if($this->uri->segment(4)){ ?>
                        <i class="fa fa-angle-<?php echo ($langs=='en'?'right':'left'); ?>"></i>
                        <?php } ?>
					</li>
                    <li>
						<?php echo ucfirst($this->uri->segment(4));?>
					</li>
				</ul>
                
				<div class="page-toolbar">
					<!--<div id="dashboard-report-range" class="pull-right tooltips btn btn-fit-height btn-primary" data-container="body" data-placement="bottom" data-original-title="Change dashboard date range">
						<i class="icon-calendar"></i>&nbsp; <span class="thin uppercase visible-lg-inline-block">November 20, 2016 - December 19, 2016</span>&nbsp; <i class="fa fa-angle-down"></i>
					</div>-->
                    <div class="breadcrumb-username">Fiscal Year: <i><?php echo FY_YEAR; ?></i> <br/>User: <i><?php echo $_SESSION['username']; ?></i></div>
				</div>
                
			</div>
			<!-- END PAGE HEADER-->