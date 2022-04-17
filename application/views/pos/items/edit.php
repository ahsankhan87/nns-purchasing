<div class="row">
    <div class="col-md-12">
        <div class="portlet">
        	<div class="portlet-title">
        		<div class="caption">
        			<i class="fa fa-reorder"></i>Update Product
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
                foreach($Item as $keys => $values):
                $attributes = array('class' => 'form-horizontal', 'role' => 'form','enctype'=>"multipart/form-data");
                echo validation_errors();
                echo form_open('pos/Items/edit',$attributes);
                echo  form_hidden('item_id',$values['item_id']);
                echo  form_hidden('id',$values['id']);
                ?>
                <input type="hidden" value="<?php echo $values['size_id'] ?>" class="form-control"/>
                
                	<div class="form-body">
      				<h3 class="form-section">Product Info</h3>
                    
                        <!--/row-->
        				<!--<div class="row">-->
        				<!--	<div class="col-md-6">-->
                    	            
            <!--                        <div class="form-group">-->
            <!--                            <label class="control-label col-md-3">Select Picture</label>-->
            <!--                            <div class="col-md-9">-->
                                     <?php
                                        
            // <!--                            if($values['picture'] == '' || empty($values['picture']))-->
            // <!--                            {-->
            // <!--                                echo '<img src="'. base_url('images/default-photo.png') .'" width="100" height="100" class="img-rounded" alt="picture"/>';-->
            // <!--                            }else{-->
            // <!--                                echo '<img src="'. base_url('images/items/thumb/'.$values['picture']) .'" width="100" height="100" class="img-rounded" alt="picture"/>';    -->
            // <!--                            }-->
                                        
                                        ?>
                                        
            <!--                            <input type="hidden" name="picture" value="<?php echo $values['picture']; ?>" />-->
            <!--                            <input type="file" class="form-control" value="" name="upload_pic" />-->
            <!--                            </div>-->
            <!--                        </div>-->
            <!--                    </div>-->
        					<!--/span-->
        				<!--</div>-->
        				<!--/row-->
                        
        				<!--/row-->
        				<div class="row">
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">Category</label>
        							<div class="col-md-9">
        								<?php echo form_dropdown('category_id',$categoryDDL,$values['category_id'],'class="form-control select2me"'); ?>
        								
        							</div>
        						</div>
        					</div>
        					
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">Supplier</label>
        							<div class="col-md-9">
        								<!--<input type="text" name="supplier" value="<?php echo $values['supplier'] ?>" class="form-control" placeholder="Supplier">-->
        								<?php echo form_dropdown('supplier_id',$supplierDDL,$values['supplier_id'],'class="form-control select2me" id="supplier_id"'); ?>
        								
        							</div>
        						</div>
        					</div>
        					
        					<!--/span-->
        					<!--<div class="col-md-6">-->
        					<!--	<div class="form-group">-->
        					<!--		<label class="control-label col-md-3">Location</label>-->
        					<!--		<div class="col-md-9">-->
        					<!--			<?php echo form_dropdown('location_id',$locationDDL,$values['location_id'],'class="form-control select2me"'); ?>-->
        					<!--		</div>-->
        					<!--	</div>-->
        					<!--</div>-->
        					<!--/span-->
        				</div>
        				<!--/row-->
                        
                        <div class="row">
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">Product Name</label>
        							<div class="col-md-9">
        								<input type="text" name="name" value="<?php echo $values['name'] ?>" class="form-control" placeholder="Product Name">
        								
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
        				<div class="row">
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">Price</label>
        							<div class="col-md-9">
        								<input type="text" name="avg_cost" value="<?php echo $values['avg_cost'] ?>" step="0.0001" class="form-control">
        							</div>
        						</div>
        					</div>
        					
        				 
        					<div class="col-md-6">
        						<div class="form-group">
                                  <label class="control-label col-sm-3">Supplier PHP Cost:</label>
                                  <div class="col-sm-9">
                                      
                                    
                                    <input type="text" min="0" name="php_cost" readonly="" step="0.0001" id="input_php_cost" class="form-control" />
                                  </div>
                                </div>
                            </div>
        					<!--/span-->
        					
        					<!--<div class="col-md-6">-->
        					<!--	<div class="form-group">-->
        					<!--		<label class="control-label col-md-3">Sale/Retail Price</label>-->
        					<!--		<div class="col-md-9">-->
        					<!--			<input type="number" name="unit_price" step="0.01" value="<?php echo $values['unit_price'] ?>" class="form-control">-->
        					<!--		</div>-->
        					<!--	</div>-->
        					<!--</div>-->
        				</div>
                        <!--/row-->
        				<div class="row">
                            
                            <div class="col-md-6">
        						<div class="form-group">
                                  <label class="control-label col-sm-3">Units:</label>
                                  <div class="col-sm-9">
                                    <?php echo form_dropdown('unit_id',$unitsDDL,$values['unit_id'],'class="form-control select2me"'); ?>
                                  </div>
                                </div>
                            </div>
        					<!--/span-->
                            
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">Quoted Quantity</label>
        							<div class="col-md-9">
        								<input type="text" name="quoted_qty" value="<?php echo $values['quoted_qty'] ?>" class="form-control" placeholder="Quoted Quantity">
        								
        							</div>
        						</div>
        					</div>
        					<!--<div class="col-md-6">-->
        					<!--	<div class="form-group">-->
        					<!--		<label class="control-label col-md-3">Re-Stock Level</label>-->
        					<!--		<div class="col-md-9">-->
        					<!--			<input type="number" name="reorder_level" value="<?php echo $values['re_stock_level'] ?>" class="form-control">-->
        					<!--		</div>-->
        					<!--	</div>-->
        					<!--</div>-->
        					
        				</div>
                        <!--/row-->
                        
                        <div class="row">
        				    
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3"><span class="required">* </span>PHP Landed Cost</label>
        							<div class="col-md-9">
        								<input type="text" name="local_currency" id="local_currency" value="<?php echo $values['local_currency'] ?>" step="0.0001" class="form-control" />
        							</div>
        						</div>
        					</div>
        					
        							
        					<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3"><span class="required">* </span>USD Landed Cost</label>
        							<div class="col-md-9">
        								<input type="number" min="0" name="landed_cost" value="<?php echo $values['landed_cost'] ?>" step="0.0001" id="landed_cost" value="<?php echo set_value('landed_cost') ?>" class="form-control" />
        							</div>
        						</div>
        					</div>
        					
        				
        				</div>	
        				
        				<div class="row">
        				    
        				    <div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3"><span class="required">* </span>Shipping Terms</label>
        							<div class="col-md-9">
        								<!--<input type="text" name="shipping_terms" id="shipping_terms" value="<?php echo $values['shipping_terms'] ?>" class="form-control" />-->
        								<?php echo form_dropdown('shipping_term_id',$shipping_termsDDL,$values['shipping_terms'],'class="form-control select2me"'); ?>
        							</div>
        						</div>
        					</div>
        					<!--/span-->
							<div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">HS Code</label>
        							<div class="col-md-9">
        								<input type="text" name="hs_code" value="<?php echo $values['hs_code'] ?>" autocomplete="off" class="form-control" />
        							</div>
        						</div>
        					</div>
        				</div>
        				
                        <div class="row">
							<!--<div class="col-md-6">-->
       <!-- 						<div class="form-group">-->
       <!-- 							<label class="control-label col-md-3">Barcode</label>-->
       <!-- 							<div class="col-md-9">-->
       <!-- 								<input type="text"  name="barcode" value="<?php echo $values['barcode'] ?>" class="form-control" />-->
       <!-- 							</div>-->
       <!-- 						</div>-->
       <!-- 					</div>-->
						</div>
                    <!--    
        				<h3 class="form-section">Select Sizes and Enter Barcode</h3>
        				
                        <div class="row">
                            <div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">Size</label>
        							<div class="col-md-9">
        								<?php echo form_dropdown('size_id',$sizesDDL,$values['size_id'],'class="form-control"'); ?>
        							</div>
        						</div>
        					</div>
                            <div class="col-md-6">
        						<div class="form-group">
        							<label class="control-label col-md-3">Barcode</label>
        							<div class="col-md-9">
        								<input type="text" name="barcode" value="<?php echo $values['barcode'] ?>" class="form-control">
        							</div>
        						</div>
        					</div>
     					
                        </div>
        				<!--/row-->
        			</div>
        			<div class="form-actions">
        				<div class="row">
        					<div class="col-md-6">
        						<div class="row">
        							<div class="col-md-offset-3 col-md-9">
        								<button type="submit" class="btn btn-success">Update</button>
        								<button type="button" onclick="window.history.back();" class="btn btn-default">Cancel</button>
        							</div>
        						</div>
        					</div>
        					<div class="col-md-6">
        					</div>
        				</div>
        			</div>
        		<?php endforeach;
                echo form_close();?>
        		<!-- END FORM-->
        	</div>
        </div>
  </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
<script>
$(document).ready(function(){
	var site_url = '<?php echo site_url($langs); ?>';
    var base_url = '<?php echo base_url(); ?>';
    
    //console.log($("#supplier_id").val());
    get_cost_from_supplier($("#supplier_id").val());
    
    $("#supplier_id").on('change',function(){
        
        var supplier_id = $(this).val();
        get_cost_from_supplier(supplier_id);
        
    });
    
    function get_cost_from_supplier(supplier_id){
        
        $.get(site_url+"/pos/C_suppliers/get_supplier_dtl_cost/"+supplier_id, function(data, status){
        
            var xdata = JSON.parse(data);
        
            $("#input_dtl_cost").val(xdata.dtl_cost);
             $("#input_php_cost").val(xdata.php_cost);
            console.log(xdata);
        });
    }
    
// 	$("#cost_price").keypress(function(){
//         $("#landed_cost").val($("#cost_price").val());
        
//         console.log($("#cost_price").val());
//       });
});
</script>
