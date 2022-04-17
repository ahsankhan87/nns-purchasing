<div class='row hidden-print'>
   <div class='col-md-12'> 
        <div class="well">
            <form method="post" action="<?php echo site_url('reports/C_logisticsReport')?>" class="form-horizontal"> 
            		
           <div class="form-group">
             
                 <label class="control-label col-sm-2" for="">From Date</label>
                 <div class="col-sm-4">
                    <input type="date" class="form-control" id="datepicker" value="<?php echo date('Y-m-d'); ?>" name="from_date" autocomplete="off"  />
                 </div> 
                 
                 <label class="control-label col-sm-2" for="">To Date</label>
                 <div class="col-sm-4">
                    <input type="date" class="form-control" id="Todatepicker" value="<?php echo date('Y-m-d'); ?>" name="to_date" autocomplete="off" />
                 </div> 
                    
            </div>
            
                        <!--<div class="form-group">-->
                         
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
                        
                        <div class="form-group">
                         
                             <label class="control-label col-sm-2" for="Status">Status</label>
                             <div class="col-sm-4">
                                <select class="form-control" name="status">
                                    <option>All</option>
                                    <option>Paid</option>
                                    <option>Unpaid</option>
                                    
                                </select>
                             </div> 
                             
                             <div class="col-sm-offset-2 col-sm-4">
                              <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                        
          
             </form>
        </div>
   	</div>
</div>


<?php

if(count((array)@$logistics))
{
?>
<div class="row">
    <div class="col-sm-12">
        <h2 class="page-header lead"><?php echo $status ?> Report From <strong><?php echo date('m-d-Y',strtotime($from_date)) . ' To ' . date('m-d-Y',strtotime($to_date)); ?></strong></h2>
    </div>
     <!--/.col-sm-12 -->
</div>

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
                                        <th></th>
                                        <th>PO #</th>
                                        <th>Billing Company</th>
                                        <th>Reference #</th>
                                        <th>Payment Date</th>
                                        <th>Total</th>
                                        
                                    </tr>
                                </thead>
                                
                                <tbody>
                            <?php
                            $unit_price =0;
                            $cost_price=0;
                            //var_dump($this->M_receivings->get_totalCostByCategory_id());
                            foreach($logistics as $key => $list)
                            {
                                 $supplier_receiving = $this->M_receivings->get_receiving_supplier(@$list['receiving_id']);
                                echo '<tr valign="top">';
                                echo '<td></td>';
                                echo '<td>'.@$supplier_receiving[0]['invoice_no'].'</td>';
                                //echo '<td>'.$this->M_suppliers->get_supplierName(@$supplier_receiving[0]['supplier_id']).'</td>';
                                //echo '<td>'.$this->M_category->get_CatNameByItem($list['department_id']).'</td>';
                                //echo '<td>'.$list['shipping'].'</td>';
                                echo '<td class="text-center">'.$list['billing_company'].'</td>';
                                echo '<td class="text-center">'.$list['reference_no'].'</td>';
                                echo '<td class="text-center">'.date("m/d/Y",strtotime($list['payment_date'])).'</td>';
                                echo '<td class="text-center">₱'.number_format($list['total'],2).'</td>';
                                echo '</tr>';
                                
                                $unit_price +=$list['total'];
                            }
                            
                            echo '</tbody>';
                            ?>
                            
                            <tfoot>
                                <tr>
                                    <th></th><th></th><th></th>
                                    <th></th>
                                    <th>Total</th>
                                    <th>₱<?php echo number_format($unit_price,2) ?></th>
                                    
                                </tr>
                            </tfoot>
                            </table>     
                    </div>
                </div>
                <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
</div>
 
<?php } ?>