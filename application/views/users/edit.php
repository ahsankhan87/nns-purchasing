<div class="row">
    <div class="col-sm-12">
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-reorder"></i>User Form
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a>
					<a href="#portlet-config" data-toggle="modal" class="config"></a>
					<a href="javascript:;" class="reload"></a>
					<a href="javascript:;" class="remove"></a>
				</div>
			</div>
			<div class="portlet-body form">
            
				<!-- BEGIN FORM-->
				<?php 
                    $attributes = array('class' => 'horizontal-form','enctype'=>"multipart/form-data");
                    echo validation_errors();
                    echo form_open('setting/users/C_users/editUser',$attributes);
                    foreach($users as $user):
                    echo form_hidden("id",$user['id']);
                    ?>
					<div class="form-body">
						<h3 class="form-section">User Information</h3>
                        
                        <div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>Role</label>
                                    <?php $data = array(''=>'Please Select','admin'=>'Admin','user'=>'User');
                                    
                                    echo form_dropdown('role',$data,$user['role'],'class="form-control"'); ?>
									
								</div>
							</div>
							<!--/span-->
                            
                        </div>
                        
                        <div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>Full Name</label>
									<input type="text" name="name" value="<?php echo $user['name'] ?>" class="form-control" />
								</div>
							</div>
							<!--/span-->
                            <div class="col-md-6">
								<div class="form-group">
									<label>Username</label>
									<input type="text" name="username" value="<?php echo $user['username'] ?>" required="" class="form-control" />
								</div>
							</div>
							<!--/span-->
                        </div>
                         
                        
					<div class="form-actions right">
                        <button type="submit" class="btn btn-info"><i class="fa fa-check"></i> Update</button>                    
						<button type="button" onclick="window.history.back()" class="btn btn-default">Back</button>
						
					</div>
				<?php 
                endforeach;
                echo form_close(); ?>
				<!-- END FORM-->
			</div>
		</div>

    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->