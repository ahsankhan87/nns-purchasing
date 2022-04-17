<div class="clearfix">
</div>

<div class="row">
    
		<div class="col-md-6 col-sm-6">
			<div class="portlet">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bell"></i>Incoming Products
					</div>
					<!--<div class="actions">-->
					<!--	<div class="btn-group">-->
					<!--		<a class="btn btn-default btn-sm dropdown-toggle" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">-->
					<!--		Filter By <i class="fa fa-angle-down"></i>-->
					<!--		</a>-->
					<!--		<div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Finance</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> Membership</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Customer Support</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> HR</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> System</label>-->
					<!--		</div>-->
					<!--	</div>-->
					<!--</div>-->
				</div>
				<div class="portlet-body">
					<div class="table-scrollable" style="min-height:230px">
						<table class="table table-striped table-bordered table-hover">
						<thead>
						<tr>
							<th>
								 Product
							</th>
							<th>Qty</th>
							<th>
								 PO#
							</th>
							<th>
								 ETD
							</th>
							<th>
							    ETA
							</th>
							<th>AWB</th>
						</tr>
						</thead>
						<tbody>
						    <?php 
						    foreach($PurchaseItemsReport as $values):
                                echo '<tr>';
                                echo '<td>';
                                echo $this->M_items->get_itemName($values['item_id']);
                                echo '</td>';
                                echo '<td class="text-center">'.number_format($values['qty']).'</td>';
                                echo '<td>';
                                echo $values['invoice_no'];
                                echo '</td>';
                                echo '<td>';
                                echo $values['etd'];
                                echo '</td>';
                                echo '<td>';
                                echo $values['eta'];
                                echo '</td>';
                                echo '<td>';
                                echo $values['awb'];
                                echo '</td></tr>';
                            endforeach;
						    ?>
						</tbody>
						</table>
						<div class="pull-right "><a class="margin-bottom-5" href="<?php echo site_url('trans/C_incomingProducts');?>">view all</a></div>
					</div>
					
				</div>
				
			</div>
		</div><!--col-6-->
		
		
		<div class="col-md-6 col-sm-6">
			<div class="portlet">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bell"></i>Purchase Requests
					</div>
					<!--<div class="actions">-->
					<!--	<div class="btn-group">-->
					<!--		<a class="btn btn-default btn-sm dropdown-toggle" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">-->
					<!--		Filter By <i class="fa fa-angle-down"></i>-->
					<!--		</a>-->
					<!--		<div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Finance</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> Membership</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Customer Support</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> HR</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> System</label>-->
					<!--		</div>-->
					<!--	</div>-->
					<!--</div>-->
				</div>
				<div class="portlet-body">
					<div class="table-scrollable" style="min-height:230px">
						<table class="table table-striped table-bordered table-hover">
						<thead>
						<tr>
							<th>
								 Product
							</th>
							<th>
								 Qty 
							</th>
							<th>
								 Unit
							</th>
							<th>
							    Requiements
							</th>
							
						</tr>
						</thead>
						<tbody>
						    <?php 
						    foreach($purchase_request_report as $values):
                                echo '<tr>';
                                echo '<td>';
                                echo $this->M_items->get_itemName($values['item_id']);
                                // echo $values['item'];
                                
                                echo '</td>';
                                echo '<td class="text-center">';
                                echo number_format($values['qty']);
                                echo '</td>';
                                echo '<td class="text-center">';
                                echo $this->M_units->get_unitName($values['unit_id']);
                                echo '</td>';
                                echo '<td class="text-center">';
                                echo $values['requirements'];
                                echo '</td>';
                               
                                echo '</tr>';
                            endforeach;
						    ?>
						</tbody>
						</table>
						<span class="pull-right"><a href="<?php echo site_url('trans/C_purchase_requests');?>">view all</a></span>
					</div>
					
				</div>
			</div>
		</div><!--col-6-->
		
		
		<div class="col-md-6 col-sm-6">
			<div class="portlet">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bell"></i>Incoming Samples
					</div>
					<!--<div class="actions">-->
					<!--	<div class="btn-group">-->
					<!--		<a class="btn btn-default btn-sm dropdown-toggle" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">-->
					<!--		Filter By <i class="fa fa-angle-down"></i>-->
					<!--		</a>-->
					<!--		<div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Finance</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> Membership</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Customer Support</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> HR</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> System</label>-->
					<!--		</div>-->
					<!--	</div>-->
					<!--</div>-->
				</div>
				<div class="portlet-body">
					<div class="table-scrollable" style="min-height:230px">
						<table class="table table-striped table-bordered table-hover">
						<thead>
						<tr>
							<th>
								 Product
							</th>
							<th>
								 Supplier
							</th>
							<th>
								 Qty
							</th>
							<th>
							    Price
							</th>
							
						</tr>
						</thead>
						<tbody class="text-center">
						    <?php 
						    foreach($sampleReport as $values):
                                echo '<tr>';
                                echo '<td>';
                                //echo $this->M_items->get_itemName($values['item_id']);
                                echo $values['item'];
                                
                                echo '</td>';
                                echo '<td>';
                                echo $values['supplier'];
                                echo '</td>';
                                echo '<td>';
                                echo number_format($values['qty']);
                                echo '</td>';
                                echo '<td>';
                                echo number_format($values['price'],2);
                                echo '</td>';
                               
                                echo '</tr>';
                            endforeach;
						    ?>
						</tbody>
						</table>
						<span class="pull-right"><a href="<?php echo site_url('trans/C_samples');?>">view all</a></span>
					</div>
					
				</div>
			</div>
		</div><!--col-6-->
		
		
		<div class="col-md-6 col-sm-6">
			<div class="portlet">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bell"></i>Sourcing
					</div>
					<!--<div class="actions">-->
					<!--	<div class="btn-group">-->
					<!--		<a class="btn btn-default btn-sm dropdown-toggle" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">-->
					<!--		Filter By <i class="fa fa-angle-down"></i>-->
					<!--		</a>-->
					<!--		<div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Finance</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> Membership</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Customer Support</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> HR</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> System</label>-->
					<!--		</div>-->
					<!--	</div>-->
					<!--</div>-->
				</div>
				<div class="portlet-body">
					<div class="table-scrollable" style="min-height:230px">
						<table class="table table-striped table-bordered table-hover">
						<thead>
						<tr>
							<th>
								 Product
							</th>
							<th>
								Requested By
							</th>
							<th>
								 Department
							</th>
							<th>Urgency</th>
						</tr>
						</thead>
						<tbody class="text-center">
						    <?php
                            foreach($sourcingReport as $key => $list)
                            {
                                echo '<tr valign="top">';
                                //echo '<td>'.$list['id'].'</td>';
                                echo '<td>'.$list['product'].'</td>';
                                echo '<td>'.$list['requested_by'].'</td>';
                                echo '<td>'.$this->M_category->get_CatNameByItem($list['department_id']).'</td>';
                                echo '<td>'.$list['urgency'].'</td>';
                                // echo '<td>'.date('m-d-Y',strtotime($list['request_date'])).'</td>';
                                // echo '<td>'.$list['sourced_by'].'</td>';
                                // echo '<td>'.$list['status'].'</td>';
                                // echo '<td>'.anchor('trans/C_sourcing/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>'). ' | ';
                                // echo  anchor('trans/C_sourcing/delete/'.$list['id'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"'). '</td>';
                                echo '</tr>';
                            }
                            
                            ?>
        
						</tbody>
						</table>
						<span class="pull-right"><a href="<?php echo site_url('trans/C_sourcing');?>">view all</a></span>
					</div>
					
				</div>
			</div>
		</div><!--col-6-->
		
		
        <div class="col-md-6 col-sm-6">
			<div class="portlet">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bell"></i>Unpaid Purchases
					</div>
					<!--<div class="actions">-->
					<!--	<div class="btn-group">-->
					<!--		<a class="btn btn-default btn-sm dropdown-toggle" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">-->
					<!--		Filter By <i class="fa fa-angle-down"></i>-->
					<!--		</a>-->
					<!--		<div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Finance</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> Membership</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Customer Support</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> HR</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> System</label>-->
					<!--		</div>-->
					<!--	</div>-->
					<!--</div>-->
				</div>
				<div class="portlet-body">
					<div class="table-scrollable" style="min-height:230px">
						<table class="table table-striped table-bordered table-hover">
						<thead>
						<tr>
							<th>
								 PO#
							</th>
							<th>
								 Date
							</th>
							<th>
								 Supplier
							</th>
						
						</tr>
						</thead>
						<tbody class="text-center">
						    <?php 
						    foreach($PurchaseReport as $values):
                                echo '<tr>';
                                echo '<td>';
                                echo $values['invoice_no'];
                                echo '</td>';
                                echo '<td>';
                                echo date('m/d/Y',strtotime($values['receiving_date']));
                                echo '</td>';
                                echo '<td>';
                                echo $values['supplier'];
                                echo '</td></tr>';
                            endforeach;
						    ?>
						
						</tbody>
						</table>
						<span class="pull-right"><a href="<?php echo site_url('trans/C_receivings/allPurchases');?>">view all</a></span>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="col-md-6 col-sm-6">
			<div class="portlet">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bell"></i>Unpaid Logistics
					</div>
					<!--<div class="actions">-->
					<!--	<div class="btn-group">-->
					<!--		<a class="btn btn-default btn-sm dropdown-toggle" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">-->
					<!--		Filter By <i class="fa fa-angle-down"></i>-->
					<!--		</a>-->
					<!--		<div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Finance</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> Membership</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Customer Support</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> HR</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> System</label>-->
					<!--		</div>-->
					<!--	</div>-->
					<!--</div>-->
				</div>
				<div class="portlet-body">
					<div class="table-scrollable" style="min-height:230px">
						<table class="table table-striped table-bordered table-hover">
						<thead>
						<tr>
							<th>
								 PO#
							</th>
							<th>
								Supplier
							</th>
							<th>
								 Company
							</th>
							<th>Total</th>
						</tr>
						</thead>
						<tbody class="text-center">
						    <?php
                            foreach($logisticsReport as $key => $list)
                            {
                                $supplier_receiving = $this->M_receivings->get_receiving_supplier(@$list['receiving_id']);
                                echo '<tr valign="top">';
                                echo '<td>'.@$supplier_receiving[0]['invoice_no'].'</td>';
                                echo '<td>'.$this->M_suppliers->get_supplierName(@$supplier_receiving[0]['supplier_id']).'</td>';
                                //echo '<td>'.$this->M_category->get_CatNameByItem($list['department_id']).'</td>';
                                //echo '<td>'.$list['shipping'].'</td>';
                                echo '<td>'.$list['billing_company'].'</td>';
                                //echo '<td>'.$list['reference_no'].'</td>';
                                echo '<td>₱'.number_format($list['total'],2).'</td>';
                                echo '</tr>';
                            }
                            echo '</tbody> </table>';
                            
                            ?>
        
						</tbody>
						</table>
						<span class="pull-right"><a href="<?php echo site_url('trans/C_logistics_fees');?>">view all</a></span>
					</div>
					
				</div>
			</div>
		</div><!--col-6-->
		
		<div class="col-md-6 col-sm-6">
			<div class="portlet">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-bell"></i>Pending Claims
					</div>
					<!--<div class="actions">-->
					<!--	<div class="btn-group">-->
					<!--		<a class="btn btn-default btn-sm dropdown-toggle" href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">-->
					<!--		Filter By <i class="fa fa-angle-down"></i>-->
					<!--		</a>-->
					<!--		<div class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Finance</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> Membership</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> Customer Support</label>-->
					<!--			<label><div class="checker"><span class="checked"><input type="checkbox" checked=""></span></div> HR</label>-->
					<!--			<label><div class="checker"><span><input type="checkbox"></span></div> System</label>-->
					<!--		</div>-->
					<!--	</div>-->
					<!--</div>-->
				</div>
				<div class="portlet-body">
					<div class="table-scrollable" style="min-height:230px">
						<table class="table table-striped table-bordered table-hover">
						<thead>
						<tr>
							<th>
								 PO#
							</th>
							<th>
								Supplier
							</th>
							<th>
								 NCR
							</th>
							
						</tr>
						</thead>
						<tbody class="text-center">
						    <?php 
						    foreach($claimsReport as $values):
						        @$supplier_receiving = $this->M_receivings->get_receiving_supplier($values['receiving_id']);
						        
                                echo '<tr>';
                                echo '<td>';
                                echo @$supplier_receiving[0]['invoice_no'];
                                echo '</td>';
                                echo '<td>';
                                echo $this->M_suppliers->get_supplierName(@$supplier_receiving[0]['supplier_id']);
                                echo '</td>';
                                echo '<td>'.$values['ncr'].'</td>';
                                //echo '<td>'.$values['status'].'</td>';
            
                                echo '</tr>';
                            endforeach;
						    ?>
						</tbody>
						</table>
						<span class="pull-right"><a href="<?php echo site_url('trans/C_claims');?>">view all</a></span>
					</div>
					
				</div>
			</div>
		</div><!--col-6-->
		
</div>