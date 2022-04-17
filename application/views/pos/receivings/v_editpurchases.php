<div ng-controller="editpurchaseCtrl" ng-init="getAllProduct(); editProductList('<?php echo @$receiving_id; ?>',<?php echo @$edit; ?>);">
<!--<input type="text" ng-model="invoice_no" ng-init="invoice_no='<?php echo @$invoice_no; ?>'" value="{{invoice_no}}" />-->
    
<div class='row'>
    
    <div class='col-xs-12 col-sm-3 col-md-3 col-lg-3'>
        <table class="table table-bordered table-hover">
            
            <thead>
            <!--<tr>-->
            <!--    <td colspan="4"><input ng-change="addItemByBarcode(barcode)" autofocus ng-trim="true" ng-model="barcode" type="text" placeholder="Paste Barcode" class="form-control">-->
            <!--    </td>-->
            <!--</tr>-->
             <tr>
                <td colspan="4"><input type="search" ng:model="search" placeholder="Search Products" class="form-control" /></td>
            </tr>   
             <tr>
                <!-- <th>Sizes</th> -->
                <th>Products</th>
                <th>Qty</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr ng-show="loader">
                <td colspan="4" class="text-center"><img src="<?php echo base_url('images/wait.gif'); ?>" width="50" height="50" title="Loading" alt="Loading" /></td>
            </tr>
            <!-- <tr ng:repeat="item in products | filter:search | filter:{service:0} | limitTo:30"> -->
            <tr ng:repeat="item in products | filter:search | limitTo:30">

                <!-- <td ng-click='addItem(item.item_id,item.size_id)' style="cursor: pointer;"><small>{{item.size}}</small></td> -->
                <td ng-click='addItem(item.item_id,item.size_id)' style="cursor: pointer;"><a href="#"><label>{{item.name}}</label></a></td>
                <td ng-click='addItem(item.item_id,item.size_id)' style="cursor: pointer;"><label>{{item.quantity}}</label></td>
                <td ng-click='addItem(item.item_id,item.size_id)' style="cursor: pointer;"> <i class="fa fa-plus fa-1x" style="color:green;"></i></td>
                
            </tr>
            </tbody>
        </table>
    </div>

<form id="editPurchaseFrom" enctype="multipart/form-data">
<div class='col-xs-12 col-sm-9 col-md-9 col-lg-9'>
   <div class="row">
  <input type="hidden" ng-model="receiving_id" ng-init="receiving_id='<?php echo @$receiving_id; ?>'" name="receiving_id" value="{{receiving_id}}" />
 
   <?php if($purchaseType === ''){ ?>
   <!--<div class="form-group">-->
     
   <!--   <label class="control-label col-sm-2" for="">Purchase Type</label>-->
   <!--      <div class="col-sm-4">-->
   <!--         <div class="form-group">-->
     
   <!--             <div class="radio-list">-->
   <!--     			<label class="radio-inline" ng-init="purchaseType='cash'">-->
   <!--     			<div class="radio" id="uniform-optionsRadios4">-->
   <!--                 <input type="radio" name="purchaseType" ng-model="purchaseType" id="optionsRadios4" value="cash" checked=""></div> Cash </label>-->
        			
   <!--                 <label class="radio-inline">-->
   <!--     			<div class="radio" id="uniform-optionsRadios5">-->
   <!--                 <input type="radio" name="purchaseType" ng-model="purchaseType" id="optionsRadios5" value="credit" ></div> Credit </label>-->
    			
   <!-- 		    </div>-->
   <!--         </div>  -->
   <!--   </div>-->
      
   <!--    <label class="control-label col-sm-2" for="">Register Mode</label>-->
   <!--    <div class="col-sm-4" ng-init="register_mode='receive'">-->
   <!--          <div class="form-group">-->
   <!--              <div class="radio-list">-->
   <!--     			<label class="radio-inline">-->
   <!--     			<div class="radio" id="uniform-optionsRadios4">-->
   <!--                 <input type="radio" name="register_mode" ng-model="register_mode" id="optionsRadios4" value="receive" checked=""></div> Receive </label>-->
        			
   <!--                 <label class="radio-inline">-->
   <!--     			<div class="radio" id="uniform-optionsRadios5">-->
   <!--                 <input type="radio" name="register_mode" ng-model="register_mode" id="optionsRadios5" value="return"></div> Return </label>-->
    			
   <!-- 		    </div>-->
   <!--         </div> -->
   <!--   </div>-->
   <!-- </div><!-- /. end row -->
   
   <?php }?>
    
    <?php 
        
          if($purchaseType === 'cash')
            {
                echo '<input type="hidden" name="purchaseType" ng-model="purchaseType" ng-init="purchaseType=\'cash\'" value="cash"/>';
                 echo '<input type="hidden" name="register_mode" ng-model="register_mode" ng-init="register_mode=\'receive\'" value="receive"/>';
            }
          if($purchaseType === 'credit')
            {
                echo '<input type="hidden" name="purchaseType" ng-model="purchaseType" ng-init="purchaseType=\'credit\'" value="credit"/>';
                echo '<input type="hidden" name="register_mode" ng-model="register_mode" ng-init="register_mode=\'receive\'" value="receive"/>';
            } 
          if($purchaseType === 'cashReturn')
            {
                echo '<input type="hidden" name="purchaseType" ng-model="purchaseType" ng-init="purchaseType=\'cash\'" value="cash"/>';
                echo '<input type="hidden" name="register_mode" ng-model="register_mode" ng-init="register_mode=\'return\'" value="return"/>';
            } 
          if($purchaseType === 'creditReturn')
            {
                echo '<input type="hidden" name="purchaseType" ng-model="purchaseType" ng-init="purchaseType=\'credit\'" value="credit"/>';
                echo '<input type="hidden" name="register_mode" ng-model="register_mode" ng-init="register_mode=\'return\'" value="return"/>';
            }  
    ?>
    
   <div class="row">     
    <div class="form-group">
     
    <label class="control-label col-sm-2" for="">Supplier</label>
     <div class="col-sm-4" ng-init="supplier_id=''">
        <select class="form-control select2me" ng:model="supplier_id" name="supplier_id" id="supp"  ng:change="getAllProductBySupplier(supplier_id)">
            <?php 
                foreach($supplierDDL as $key=>$values):
                    echo '<option value="'.$key.'">';
                    echo $values;
                    echo '</option>';
                endforeach;
            ?>
         </select>
         <?php echo anchor('pos/Suppliers/create','Add New <i class="fa fa-plus"></i>',''); ?>
     </div> 
    
    <label class="control-label col-sm-2" for="">Invoice #</label>
     <div class="col-sm-4" ng-init="supplier_invoice_no=''">
         <input type="text" class="form-control" id="" name="supplier_invoice_no" value="{{supplier_invoice_no}}" autocomplete="on" ng:model="supplier_invoice_no"/>
     </div>
     
    </div>
    
    </div><!-- /. end row -->
    
    <div class="row">   
    
        <div class="form-group">
            <?php //var_dump($supplier_cust); ?>
           <label for="" class="control-label col-sm-2">Documents</label>
           <label for="coa" class="col-sm-2">COA: <input type="checkbox" id="coa" name="coa" value="1" ng-model="coa" ng-checked="coa" /></label>
           <label for="msds" class="control-label col-sm-2">MSDS: <input type="checkbox" id="msds" value="1" name="msds" ng-model="msds" ng-checked="msds" /></label>
           <label for="flowchart" class="control-label col-sm-2">Flowchart: <input type="checkbox" value="1" id="flowchart" name="flowchart" ng-model="flowchart" ng-checked="flowchart" /></label>
           <label for="forme" class="control-label col-sm-2">Form E: <input type="checkbox" id="forme" name="forme" value="1" ng-model="forme" ng-checked="forme" /></label>
           <label for="halal" class="control-label col-sm-2">Halal: <input type="checkbox" id="halal" name="halal" value="1" ng-model="halal" ng-checked="halal" /></label>
           
        </div>
   </div>
   
   <div class="row">   
        <div class="form-group">
         
            <label class="control-label col-sm-2" for="">Date</label>
             <div class="col-sm-4">
                 <input type="date" ng-model="receiving_date" name="receiving_date" class="form-control" />
             </div>
         
        
            <label class="control-label col-sm-2" for="">ETA</label>
             <div class="col-sm-4">
                 <input type="text" ng-model="eta" name="eta" class="form-control" />
             </div>
         
        </div>
    </div><!-- /. end row -->
    <br/>
   <div class="row">   
        <div class="form-group">
         
            <label class="control-label col-sm-2" for="">AWB</label>
             <div class="col-sm-4">
                 <input type="text" ng-model="awb" name="awb" class="form-control" />
             </div>
         
          <label class="control-label col-sm-2" for="">ETD</label>
             <div class="col-sm-4">
                 <input type="text" ng-model="etd" name="etd" class="form-control" />
             </div>
         
        </div>
    </div><!-- /. end row -->
        <br/>
    <div class="row">   
    
        <div class="form-group" ng-init="getCurrency(currency_id)">
            <?php //var_dump($supplier_cust); ?>
            <label class="control-label col-sm-2" for="">Currency</label>
             <div class="col-sm-4">
                <?php 
                   // echo form_dropdown('currency_id',$currencyDropDown,'','ng:model="currency_id" class="form-control select2me" ');
                    
                ?>
                <select class="form-control" ng:model="currency_id" name="currency_id"  ng-change="getCurrency(currency_id)">
                    <option value="124" selected>USD</option>
                    <option value="38">Euro</option>
                    <option value="95">PHP</option>
                 </select>
            </div> 
            
            <label class="control-label col-sm-2" for="">Shipping</label>
             <div class="col-sm-4" ng-init="shipping=''">
                 <select class="form-control" ng:model="shipping" name="shipping">
                    <option value="Air" selected>Air</option>
                    <option value="By Sea">By Sea</option>
                    <option value="Local">Local</option>
                 </select>
             </div>
         
        </div>
    
    </div><!-- /. end row -->
        <br/>
    <div class="row">   
    
        <div class="form-group">
            
            <label class="control-label col-sm-2" for="">Payment</label>
             <div class="col-sm-4" ng-init="payment_status=''">
                <select class="form-control " ng:model="payment_status" name="payment_status">
                    <option value="Paid" selected>Paid</option>
                    <option value="Unpaid">Unpaid</option>
                    <option>Refund</option>
                 </select>
            </div> 
             
        
            <label class="control-label col-sm-2" for="">Payment Date</label>
             <div class="col-sm-4">
                 <input type="text" ng-model="payment_date" name="payment_date" class="form-control" />
             </div>
        </div>
    
    </div><!-- /. end row -->
    <br/>
    <div class="row">   
    
        <div class="form-group">
            
            <label class="control-label col-sm-2" for="">Delivery</label>
             <div class="col-sm-4" ng-init="delivery_status=''">
                 <select class="form-control " ng:model="delivery_status" name="delivery_status">
                    <option value="Pending" selected>Pending</option>
                    <option value="Delivered">Delivered</option>
                    <option>Cancelled</option>
                 </select>
             </div>
         
             
            <label class="control-label col-sm-2" for="">Delivery Date</label>
             <div class="col-sm-4">
                 <input type="text" ng-model="delivery_date" name="delivery_date" class="form-control" />
             </div>
         
        </div>
    
    </div><!-- /. end row -->
     <br/>
    <div class="row">   
    
        <div class="form-group">
            
            <label class="control-label col-sm-2" for="">Quotation</label>
             <div class="col-sm-4" ng-init="quotation='Pending'">
                <select class="form-control " ng:model="quotation" name="quotation">
                    <option value="Pending" selected>Pending</option>
                    <option value="Approved">Approved</option>
                    <option value="n/a">n/a</option>
                 </select>
            </div> 
             
            <label class="control-label col-sm-2" for="">Quotation File</label>
             <div class="col-sm-4">
                <input type="file" id="quotation_file"/>
            </div> 
             
        </div>
    
    </div><!-- /. end row -->
    <br/>
    <div class="row">   
    
        <div class="form-group">
            
            <label class="control-label col-sm-2" for="">FAN</label>
             <div class="col-sm-4">
                <input type="file"  id="fan" />
            </div> 
             
             
            <label class="control-label col-sm-2" for="">SSDT</label>
             <div class="col-sm-4">
                 <input type="file" id="ssdt"  />
             </div>
         
        </div>
    
    </div><!-- /. end row -->
    <br/>
    <div class="row">   
    
        <div class="form-group">
            
            <label class="control-label col-sm-2" for="">Supplier PI</label>
             <div class="col-sm-4">
                <input type="file" id="supplier_pi"/>
            </div> 
            
        </div>
    
    </div><!-- /. end row -->
    
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th width="30%">Item Name</th>
                    <!-- <th width="15%">Sizes</th> -->
                    <th width="15%">Qty</th>
                    <!--<th width="15%">Unit</th>-->
                    <th width="15%">Cost Price</th>
                    <!--<th width="15%">Unit Price</th>-->
					<th width="15%" class="text-right">Total</th>
                    <th width="5%"><a href ng:click="clearCart()" title="Clear All"><i class="fa fa-trash-o fa-1x" style="color:red;"></th>
				</tr>
			</thead>
			<tbody>
            
			 <tr ng:repeat="item in invoice.items">
                <td><input type="hidden" name="item_id[]" ng:model="item.item_id" value="{{item.item_id}}" />
                    <input type="text" ng:model="item.name" name="item_name[]" class="form-control" readonly="" /></td> 
                <!-- <td><?php  echo form_dropdown('sizes_ID',$sizesDDL,'ng:model="item.size_id"','class="form-control" ng:model="item.size_id" readonly=""');?></td>           -->
                <td><input type="number" ng:model="item.quantity" name="quantity[]" step="0.0001" min="0" class="form-control" autocomplete="off" /></td>
                <!--<td><input type="text" ng:model="item.unit" class="form-control" autocomplete="off" /></td>-->
                <td><input type="number" ng:model="item.cost_price" name="cost_price[]" step="0.0001" min="0" class="form-control" autocomplete="off" /></td>
                <!--<td><input type="number" ng:model="item.unit_price" min="0" class="form-control" autocomplete="off" /></td>-->
                
                
                <!-- IF SERVICE THEN PICK THE UNIT PRICE -->
                <td ng-if="item.service" class="text-right">{{((item.quantity * item.unit_price) + (item.quantity * item.unit_price)*item.tax_rate/100) | currency:currency_symbol:2}}</td>
                <!-- IF NOT SERVICE THEN PICK THE COST PRICE -->
                <td ng-if="!item.service" class="text-right"><input type="text" value="{{((item.quantity * item.cost_price) + (item.quantity * item.cost_price)*item.tax_rate/100) | currency:currency_symbol:2}}" readonly="" class="form-control text-right" /></td>
                
                <td class="text-center">
                    <a href ng:click="removeItem($index)" title="Remove"><i class="fa fa-trash-o fa-1x" style="color:red;"></i></a>
                </td>
            </tr>
            <tr>
                <td colspan="2" rowspan="4" ng-init="description=''">
                <!--<textarea ng:model="description" rows="6" class="form-control" placeholder="Comments" cols="5"> </textarea>-->
                </td>
                <td><strong>Sub Total:</strong></td>
                <td class="lead text-right">{{total() | currency:currency_symbol:2}}</td>
                 <td></td>
            </tr>
            <tr>
                <td><strong>Total Discount:</strong></td>
                <td ng-init="discount=0"><input type="number"  ng:model="discount" name="discount" min="0" step="0.0001" class="form-control" autocomplete="off" /></td>
                <td></td>
            </tr>
            <!--<tr>-->
            <!--    <td><small>Total Tax:</small></td>-->
            <!--    <td>-->
            <!--    {{total_tax() | currency:currency_symbol}}-->
            <!--    <input type="hidden" name="total_tax" ng:model="total_tax" ng-value="{{total_tax()}}" />-->
            <!--    </td>-->
            <!--     <td></td>-->
            <!--</tr>-->
            <!--
            <tr>
                <td><strong>Amount Due:</strong></td>
                <td ng-init="amount_due=0"><input type="number" ng:model="amount_due" ng-disabled="purchaseType !='cash'" class="form-control" autocomplete="off" /></td>
                 <td></td>
            </tr>
            -->
            
            <tr>
                <td><strong>Shipping Cost:</strong></td>
                <td ng-init="shipping_cost=0"><input type="number" ng:model="shipping_cost" name="shipping_cost" step="0.0001" class="form-control" autocomplete="off" /></td>
                 <td></td>
            </tr>
           
            <tr>
                <td> <strong>Net Total:</strong></td>
                <td class="lead text-right">{{(total()-discount)+shipping_cost | currency:currency_symbol:2}}
                <br />
                    {{(((total()-discount)-amount_due)/exchange_rate) | currency:"currency_symbol":2}}
                    <input type="hidden" value="{{total_amount}}" name="total_amount" />
                </td>
                 <td></td>
            </tr>
          <tr>
            <td colspan="6">
            <!--<button ng-click="updatePurchaseProducts();"  ng-disabled="cart_loader" ng-show="false" class="btn btn-success">Update</button>-->
            <!--<img src="<?php echo base_url('images/wait.gif'); ?>" ng-show="cart_loader" width="30" height="30" title="Loading" alt="Loading" />-->
            
            <input type="submit" name="update" value="Update form"class="btn btn-success" />
            <img src="<?php echo base_url('images/wait.gif'); ?>" id="cart_loader_1" width="30" height="30" title="Loading" alt="Loading" />
            </td>
          </tr>  
                
			</tbody>
		</table>
		</form>
	</div>
</div>
  
</div><!-- /. ng-controller = 'product ctrl' -->
<script>
 $(document).ready(function() {
     $("#cart_loader_1").hide();
     
    $("#editPurchaseFrom").submit(function(event){
    // Stop form from submitting normally
    event.preventDefault();
     
     var confirmSale = confirm('Are you absolutely sure you want to purchase?');
     if (confirmSale) {
          
        $("#cart_loader_1").show();
        
        var path = site_url+'/trans/C_receivings/editpurchaseProducts_jquery';
        ////////
             
             var formData = new FormData(this);
             var files = $('#fan')[0].files;
             var ssdt_files = $('#ssdt')[0].files;
             var supplier_pi_files = $('#supplier_pi')[0].files;
             var quotation_files = $('#quotation_file')[0].files;
             
                if(files != undefined){
                    
                }
                    formData.append('fan',files[0]);
                    formData.append('ssdt',ssdt_files[0]);
                    formData.append('supplier_pi',supplier_pi_files[0]);
                    formData.append('quotation_file',quotation_files[0]);
                    
            //console.log(files[0]);
            // Send the form data using post
            $.ajax({
                url : path, 
                type: 'POST',
                data:formData,
                cache: false,
                processData: false,
                contentType: false,
                success: function(data, textStatus, jqXHR){
                    // Display the returned data in browser
                    //$("#result").html(data);
                        if(data == '1')
                        {
                            // toastr.success("Data saved successfully",'Success');
                            // setTimeout(function() { 
                            //     location.reload(); 
                            // }, 2000);
                        }else
                        {
                            //toastr.error(data+' error','Error');
                        
                        }
                        console.log(data);
                        $("#cart_loader_1").hide();
                        window.location.href = site_url+'/trans/C_receivings/allPurchases';
                    },
                error: function(jqXHR, textStatus, errorThrown){
                    //if fails     
                    console.log(jqXHR+' '+textStatus);
                }
        
            });
      }
    });    
});
</script>