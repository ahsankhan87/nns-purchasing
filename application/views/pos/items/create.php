<div class="row">
    <div class="col-md-12">
        <div class="portlet">
        	<div class="portlet-title">
        		<div class="caption">
        			<i class="fa fa-reorder"></i>New Product
        		</div>
        		<div class="tools">
        			<a href="javascript:;" class="collapse"></a>
        			<a href="#portlet-config" data-toggle="modal" class="config"></a>
        			<a href="javascript:;" class="reload"></a>
        			
        		</div>
        	</div>
        	<div class="portlet-body form">
        		<!-- BEGIN FORM-->
        		<?php 
                $attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
                echo validation_errors();
                echo form_open('pos/Items/create',$attributes);
               
                ?>
        			<div class="form-body">
        				<h3 class="form-section">Product Info</h3>
                        <input type='hidden' name='upload_pic' value='' />
                        <!--<div class="row">-->
                        <!--    <div class="col-md-6">-->
                        <!--          <div class="form-group">-->
                                   <?php
                                    //echo '<label for="feespostingtype" class="control-label col-md-3">Select Picture</label>';
                                   ?>
                        <!--            <div class="col-md-9">-->
                        <!--                <input type="file" class="form-control" name="upload_pic" />-->
                        <!--            </div>-->
                        <!--          </div>-->
                        <!--    </div>-->
							
                        <!--</div>-->
        
        				<!--/row-->
        				<div class="row">
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">Category</label>
        							<div class="col-md-9">
        								<?php echo form_dropdown('category_id',$categoryDDL,set_value('category_id'),'class="form-control select2me" required=""'); ?>
        								
        							</div>
        						</div>
        					</div>
        					
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3"><span class="required">* </span> Supplier</label>
        							<div class="col-md-9">
        								<!--<textarea name="supplier" class="form-control"><?php echo set_value('supplier') ?></textarea>-->
        								<?php echo form_dropdown('supplier_id',$supplierDDL,set_value('supplier_id'),'class="form-control select2me" id="supplier_id"'); ?>
        								
        							</div>
        						</div>
        					</div>
        					<!--/span-->
                            
        					<!--/span-->
        					<!--<div class="col-md-6">-->
        					<!--	<div class="form-group">-->
        					<!--		<label class="control-label col-md-3">Location</label>-->
        					<!--		<div class="col-md-9">-->
        					<!--			<?php echo form_dropdown('location_id',$locationDDL,set_value('location_id'),'class="form-control select2me" '); ?>-->
        					<!--		</div>-->
        					<!--	</div>-->
        					<!--</div>-->
        					<!--/span-->
        				</div>
        				<!--/row-->
                        
                        <div class="row">
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3"><span class="required">* </span> Product Name </label>
        							<div class="col-md-9">
        								<textarea name="name" class="form-control"  required=""><?php echo set_value('name') ?></textarea>
        							</div>
        						</div>
        					</div>
        					<!--/span-->
                            
        					<div class="col-md-6">
        						<div class="form-group">
                                  <label class="control-label col-sm-3">Supplier DTL Cost:</label>
                                  <div class="col-sm-9">
                                      
                                    
                                    <input type="text" min="0" name="dtl_cost" readonly="" step="0.0001" id="input_dtl_cost" class="form-control" />
                                  </div>
                                </div>
                            </div>
        					<!--/span-->
        				</div>
        				<!--/row-->
                        
         <!--               <div class="row">-->
        	<!--				<div class="col-md-6">-->
        	<!--					<div class="form-group">-->
        	<!--						<label class="control-label col-md-3"><span class="required">* </span> Item Type </label>-->
        	<!--						<div class="col-md-9">-->
									<?php 
										//$data = array('purchased' =>'Purchased','manufactured'=>'Manufactured' );
										//echo form_dropdown('item_type',$data,set_value('item_type'),'class="form-control item_type"'); 
									?>
        	<!--						</div>-->
        	<!--					</div>-->
        	<!--				</div>-->
        					<!--/span-->
                            
        	<!--				<div class="col-md-6" id="wip_acc" style="display:none">-->
        	<!--					<div class="form-group">-->
         <!--                         <label class="control-label col-sm-3"><span class="required">* </span>WIP Account:</label>-->
         <!--                         <div class="col-sm-9 col-md-9">-->
         <!--                           <?php echo form_dropdown('wip_acc_code',$accountDDL,set_value('wip_acc_code'),'class="form-control select2me"'); ?>-->
         <!--                         </div>-->
         <!--                       </div>-->
         <!--                   </div>-->
        					<!--/span-->
        	<!--			</div>-->
        				<!--/row-->
                        
        				<div class="row">
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3"><span class="required">* </span>Price</label>
        							<div class="col-md-9">
        								<input type="number" min="0" name="cost_price" step="0.0001" id="cost_price" value="<?php echo set_value('cost_price') ?>" class="form-control" />
        							</div>
        						</div>
        					</div>
        					
        					<!--<div class="col-md-6">-->
        					<!--	<div class="form-group">-->
        					<!--		<label class="control-label col-md-3"><span class="required">* </span>USD Landed Cost</label>-->
        					<!--		<div class="col-md-9">-->
        					<!--			<input type="number" min="0" name="landed_cost" step="0.0001" id="landed_cost" value="<?php echo set_value('landed_cost') ?>" class="form-control" />-->
        					<!--		</div>-->
        					<!--	</div>-->
        					<!--</div>-->
        					
        					 
        					<div class="col-md-6">
        						<div class="form-group">
                                  <label class="control-label col-sm-3">Supplier PHP Cost:</label>
                                  <div class="col-sm-9">
                                      
                                    
                                    <input type="text" min="0" name="php_cost" readonly="" step="0.0001" id="input_php_cost" class="form-control" />
                                  </div>
                                </div>
                            </div>
        					<!--/span-->
        					
        				</div>
                        <!--/row-->
        				<div class="row">
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">Quantity</label>
        							<div class="col-md-9">
        								<input type="text" name="initial_qty_single" value="<?php echo set_value('initial_qty_single') ?>" id="initial_qty_single" class="form-control" />
        							</div>
        						</div>
        					</div>
                            <div class="col-md-6">
        						<div class="form-group">
                                  <label class="control-label col-sm-3">Units:</label>
                                  <div class="col-sm-9">
                                    <?php echo form_dropdown('unit_id',$unitsDDL,set_value('unit_id'),'class="form-control select2me" required=""'); ?>
                                  </div>
                                </div>
                            </div>
        					<!--/span-->
        					
        				 <!--   <div class="col-md-6">-->
        					<!--	<div class="form-group">-->
        					<!--		<label class="control-label col-md-3"><span class="required">* </span>PHP Landed Cost</label>-->
        					<!--		<div class="col-md-9">-->
        					<!--			<input type="text" name="local_currency" id="local_currency" value="<?php echo set_value('local_currency') ?>" class="form-control" />-->
        					<!--		</div>-->
        					<!--	</div>-->
        					<!--</div>-->
        					
        				</div>
                        <!--/row-->
        				<!--<div class="row">-->
            <!--                <div class="col-md-6">-->
        				<!--		<div class="form-group">-->
            <!--                      <label class="control-label col-sm-3">Tax:</label>-->
            <!--                      <div class="col-sm-9">-->
            <!--                        <?php echo form_dropdown('tax_id',$taxesDDL,set_value('tax_id'),'class="form-control select2me"'); ?>-->
            <!--                      </div>-->
            <!--                    </div>-->
            <!--                </div>-->
        					<!--/span-->
                            
            <!--                <div class="col-md-6">-->
        				<!--		<div class="form-group">-->
        				<!--			<label class="control-label col-md-3"> </span>Re-Stock Level</label>-->
        				<!--			<div class="col-md-9">-->
        				<!--				<input type="number" name="reorder_level" value="<?php echo set_value('reorder_level') ?>" class="form-control" />-->
        				<!--			</div>-->
        				<!--		</div>-->
        				<!--	</div>-->
                            
        				<!--</div>-->
                        
                        <!--/row-->
        				<div class="row">
        				    
        				    <div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3"><span class="required">* </span>Shipping Terms</label>
        							<div class="col-md-9">
        								<!--<input type="text" name="shipping_terms" id="shipping_terms" value="<?php echo set_value('shipping_terms') ?>" class="form-control" />-->
        								<?php echo form_dropdown('shipping_term_id',$shipping_termsDDL,set_value('shipping_term_id'),'class="form-control select2me"'); ?>
        							</div>
        						</div>
        					</div>
        					<!--/span-->
        					
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">HS Code</label>
        							<div class="col-md-9">
        								<input type="text" name="hs_code" value="" autocomplete="off" class="form-control" />
        							</div>
        						</div>
        					</div>
							<!--<div class="col-md-6">-->
       <!-- 						<div class="form-group">-->
       <!-- 							<label class="control-label col-md-3">Barcode</label>-->
       <!-- 							<div class="col-md-9">-->
       <!-- 								<input type="text" name="barcode" value="" autocomplete="off" class="form-control" />-->
       <!-- 							</div>-->
       <!-- 						</div>-->
       <!-- 					</div>-->
        				</div>	
        				
        				<!--<div class="row">-->
        				    
        					
        					
        				<!--	<div class="col-md-6">-->
        				<!--		<div class="form-group">-->
        				<!--			<label class="control-label col-md-3">Description</label>-->
        				<!--			<div class="col-md-9">-->
        				<!--				<textarea class="form-control" name="description"><?php echo set_value('description') ?></textarea>-->
        				<!--			</div>-->
        				<!--		</div>-->
        				<!--	</div>-->

        				<!--</div>	-->
                        <?php if(@$sizes){ ?>
        				<h3 class="form-section">Select Sizes and Enter Inital Quantity &amp; Barcode</h3>
        				<!--/row-->
                        <div class="row">
                        <?php foreach($sizes as $keys => $rows): ?>
        					<div class="col-md-4">
        						<div class="form-group">
        							<label class="control-label col-md-2"><?php echo ucwords($rows['name']); ?></label>
        							<div class="col-md-10">
                                        <div class="input-group">
                                        <span class="input-group-addon">
                                        <?php echo form_checkbox('sizes[]',$rows['id'],false); ?>
                                        </span>
                                        <?php $data = array('name'=>'barcode[]','placeholder'=>'Enter Barcode', 'class'=>"form-control",'type'=>'text');
                                                echo form_input($data);
                                        ?>
                                        <?php $data = array('name'=>'initial_qty[]','placeholder'=>'initial Quantity','step' => "0.01", 'class'=>"form-control",'id'=>'initial_qty','type'=>'number');
                                                echo form_input($data);
                                        ?>
                                        <?php $data = array('name'=>'size_cost_price[]','placeholder'=>'Cost Price', 'step' => "0.01", 'class'=>"form-control",'id'=>'size_cost_price','type'=>'number','setp'=>'0.01');
                                                echo form_input($data);
                                        ?>
                                        <?php $data = array('name'=>'size_unit_price[]','placeholder'=>'Sale Price', 'step' => "0.01", 'class'=>"form-control",'id'=>'size_unit_price','type'=>'number','setp'=>'0.01');
                                                echo form_input($data);
                                        ?>
        								</div>
										<!-- /input-group -->
        							</div>
        						</div>
        					</div>
     					<?php endforeach; ?>
                        </div>
        				<?php } ?>
        			</div>
        			<div class="form-actions">
        				<div class="row">
        					<div class="col-md-6">
        						<div class="row">
        							<div class="col-md-offset-3 col-md-9">
        								<button type="submit" class="btn btn-success">Submit</button>
        								<button type="button" onclick="window.history.back();" class="btn btn-default">Cancel</button>
        							</div>
        						</div>
        					</div>
        					<div class="col-md-6">
        					</div>
        				</div>
        			</div>
        		<?php echo form_close();?>
        		<!-- END FORM-->
        	</div>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){
	var site_url = '<?php echo site_url($langs); ?>';
    var base_url = '<?php echo base_url(); ?>';

	$(".item_type").on('change',function(){
		if($(this).val() == 'manufactured')
		{
			$("#wip_acc").css('display','block');
		}
		
	});
	

    $("#supplier_id").on('change',function(){
        
        var supplier_id = $(this).val();
    
        $.get(site_url+"/pos/C_suppliers/get_supplier_dtl_cost/"+supplier_id, function(data, status){
        
            var xdata = JSON.parse(data);
        
            $("#input_dtl_cost").val(xdata.dtl_cost);
             $("#input_php_cost").val(xdata.php_cost);
            console.log(xdata);
        });
    });
    
// 	$("#cost_price").keypress(function(){
//         $("#landed_cost").val($("#cost_price").val());
        
//         console.log($("#cost_price").val());
//       });
});
</script>