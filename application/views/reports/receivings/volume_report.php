<!--<div class='row hidden-print'> -->
<!--   <div class='col-md-12'>-->
<!--        <div class="well">-->
<!--            <form method="post" action="<?php echo site_url('reports/C_receivingsreport')?>" class="form-horizontal"> -->
            
<!--            <div class="form-group">-->
<!--                <label class="control-label col-sm-2" for="">Supplier</label>-->
<!--                 <div class="col-sm-4">-->
<!--                    <?php echo form_dropdown('supplier_id',$supplierDDL,'','class="form-control select2me"') ?>-->
                     
<!--                 </div> -->
                 
<!--                 <label class="control-label col-sm-2" for="">Products</label>-->
<!--                 <div class="col-sm-4">-->
<!--                     <?php echo form_dropdown('item_id',$productsDDL,'','class="form-control select2me"') ?>-->
                    
<!--                 </div> -->
<!--            </div>-->
            			
<!--           <div class="form-group">-->
             
<!--                 <label class="control-label col-sm-2" for="">From Date</label>-->
<!--                 <div class="col-sm-4">-->
<!--                    <input type="date" class="form-control" id="datepicker" value="<?php echo date('Y-m-d'); ?>" name="from_date" autocomplete="off"  />-->
<!--                 </div> -->
                 
<!--                 <label class="control-label col-sm-2" for="">To Date</label>-->
<!--                 <div class="col-sm-4">-->
<!--                    <input type="date" class="form-control" id="Todatepicker" value="<?php echo date('Y-m-d'); ?>" name="to_date" autocomplete="off" />-->
<!--                 </div> -->
                    
<!--            </div>-->
            
<!--            <div class="form-group">-->
                         
                        <!--     <label class="control-label col-sm-2" for="">Employee</label>-->
                        <!--     <div class="col-sm-4">-->
                        <!--        <?php echo form_dropdown('emp_id',$emp_DDL,'','class="form-control select2me"') ?>-->
                                
                        <!--     </div> -->
                             
                        <!--     <label class="control-label col-sm-2" for="">Register Mode</label>-->
                        <!--     <div class="col-sm-4">-->
                        <!--        <select class="form-control" name="register_mode">-->
                        <!--            <option value="all">All</option>-->
                        <!--            <option value="receive">Receive</option>-->
                        <!--            <option value="return">Return</option>p-->
                        <!--        </select>-->
                        <!--     </div> -->
                        <!--</div>-->
                        
                        <!--<div class="form-group">-->
                         
                        <!--     <label class="control-label col-sm-2" for="sale_type">Sale Type</label>-->
                        <!--     <div class="col-sm-4">-->
                        <!--        <select class="form-control" name="sale_type">-->
                        <!--            <option value="all">All</option>-->
                        <!--            <option value="cash">Cash</option>-->
                        <!--            <option value="credit">Credit</option>p-->
                        <!--        </select>-->
                        <!--     </div> -->
                             
<!--                             <div class="col-sm-offset-2 col-sm-4">-->
<!--                              <button type="submit" class="btn btn-primary">Search</button>-->
<!--                            </div>-->
<!--                        </div>-->
                        
          
<!--             </form>-->
<!--        </div>-->
<!--   	</div>-->
<!--</div>-->

 
<?php
if(count((array)@$volume_of_items))
{
?>
<!--<div class="row">-->
<!--    <div class="col-sm-12">-->
<!--        <h2 class="page-header lead"><?php echo ucfirst($sale_type). ' ';?>Report From <strong><?php echo date('d-m-Y',strtotime($from_date)) . ' To ' . date('d-m-Y',strtotime($to_date)); ?></strong></h2>-->
<!--    </div>-->
    <!-- /.col-sm-12 -->
<!--</div>-->

<div class="row">
    <div class="col-sm-12">
            <div class="portlet">
            			<div class="portlet-title">
            				<div class="caption">
            					<i class="fa fa-cogs"></i><?php echo $main; ?>
            				</div>
            				<div class="tools">
            					<a href="javascript:;" class="collapse"></a>
            					<a href="#portlet-config" data-toggle="modal" class="config"></a>
            					<a href="javascript:;" class="reload"></a>
            					<a href="javascript:;" class="remove"></a>
            				</div>
            			</div>
                    <div class="portlet-body flip-scroll">
                          
                            <table class="table table-striped table-bordered table-hover" id="sample_2">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Unit</th>
                                        
                                    </tr>
                                </thead>
                                
                                <tbody>
                            <?php
                            $unit_price =0;
                            $cost_price=0;
                            //var_dump($this->M_receivings->get_totalCostByCategory_id());
                            foreach($volume_of_items as $key => $list)
                            {
                                echo '<td>'.$list['item_id'].'</td>';
                                echo '<td>'.$this->M_items->get_itemName($list['item_id']).'</td>';
                                echo '<td class="text-center">'.number_format($list['qty']).'</td>';
                                echo '<td class="text-center">'.$this->M_units->get_unitName($list['unit_id']).'</td>';
                              
                                //echo '<td>'.$this->M_currencies->get_currencies($list['currency_id'])[0]['symbol'].round($list['item_cost_price']*$list['quantity_purchased'],2).'</td>';
                                
                                echo '</tr>';
                            }
                            
                            echo '</tbody>';
                            ?>
                            
                            <!--<tfoot>-->
                            <!--    <tr>-->
                            <!--        <th>Total</th>-->
                            <!--        <th></th>-->
                            <!--        <th></th>-->
                                    
                            <!--    </tr>-->
                            <!--</tfoot>-->
                            </table>     
                    </div>
                </div>
                <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
</div>
 
<?php } ?>