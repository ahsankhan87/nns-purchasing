<div class='row hidden-print'>
   <div class='col-md-12'> 
        <div class="well">
            <form method="post" action="<?php echo site_url('reports/C_receivingsreport')?>" class="form-horizontal"> 
            
            <div class="form-group">
                <label class="control-label col-sm-2" for="">Supplier</label>
                 <div class="col-sm-4">
                    <?php echo form_dropdown('supplier_id',$supplierDDL,'','class="form-control select2me"') ?>
                     
                 </div> 
                 
                 <label class="control-label col-sm-2" for="">Products</label>
                 <div class="col-sm-4">
                     <?php echo form_dropdown('item_id',$productsDDL,'','class="form-control select2me"') ?>
                    
                 </div> 
            </div>
            			
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
            
            <div class="form-group">
                         
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
                             
                             <div class="col-sm-offset-2 col-sm-4">
                              <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                        
          
             </form>
        </div>
   	</div>
</div>


<?php
if(count((array)@$receivings))
{
?>
<div class="row">
    <div class="col-sm-12">
        <h2 class="page-header lead"><?php echo ucfirst($sale_type). ' ';?>Report From <strong><?php echo date('m/d/Y',strtotime($from_date)) . ' To ' . date('m/d/Y',strtotime($to_date)); ?></strong></h2>
    </div>
    <!-- /.col-sm-12 -->
</div>

<div class="row">
    <div class="col-sm-12">
    
        <table class="table table-striped table-bordered table-hover" id="sample_receiving_reports">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>PO#</th>
                    <th>Supplier</th>
                    <th>Product</th>
                    <th>Unit</th>
                    <!--<th>Currency</th>-->
                    <th>Qty</th>
                    <!--<th>Cost Price</th>-->
                    <th>Total</th>
                </tr>
            </thead>
            
            <tbody>
        <?php
        $unit_price =0;
        $total_price=0;
        $qty =0;
        $curr_symbol='';
        $unit_name='';
        foreach($receivings as $key => $list)
        {
            $curr_symbol = $this->M_currencies->get_currencies($list['currency_id'])[0]['symbol'];
            $unit_name = $this->M_units->get_unit($list['unit_id'])[0]['name'];
            
            // echo '<td>'.form_checkbox('p_id[]',$list['id'],false).'</td>';
            echo '<td>'.date('m/d/Y',strtotime($list['receiving_date'])).'</td>';
            //echo '<td>'.anchor(''.$list['receiving_id'],$list['receiving_id']).'</td>';
            //echo '<td><a href="'.site_url('trans/C_receivings/receipt/'.$list['invoice_no']).'" target="_blank">'.$list['invoice_no'].'</a></td>';
            echo '<td>'.$list['invoice_no'].'</td>';
            echo '<td>'.$this->M_suppliers->get_supplierName($list['supplier_id']).'</td>';
            //echo '<td>'.$this->M_employees->get_empName($list['employee_id']).'</td>';
                        
            if($list['size_id'] != 0)
            {
                $size = $this->M_sizes->get_activeSizes($list['size_id']);
               
            }
            echo '<td>'.$this->M_items->get_ItemName($list['item_id']).' '.@$size[0]['name'].'</td>';
            
            //if($list['color_id'] != 0)
//            {
//                $color = $this->M_colors->get_activeColors($list['color_id']);
//                echo '<td>'.@$color[0]['name'].'</td>';
//            }
//            else
//            {
//                echo '<td>--</td>';
//            }
            echo '<td>'.$unit_name.'</td>';
            //echo '<td>'.$this->M_currencies->get_currencies($list['currency_id'])[0]['code'].'</td>';
            echo '<td class="text-right">'.number_format($list['quantity_purchased']).'</td>';
            //echo '<td>'.round($list['item_cost_price'],2).'</td>';
            //echo '<td>'.$list['item_unit_price'].'</td>';
          
            echo '<td class="text-right">'.$curr_symbol.number_format($list['item_cost_price']*$list['quantity_purchased'],2).'</td>';
            
            // echo  anchor(site_url('up_property_images/upload_images/'.$list['id']),' upload Images'). '</td>';
            echo '</tr>';
            $total_price += ($list['item_cost_price']*$list['quantity_purchased']);
            $qty += $list['quantity_purchased'];
            
        }
        
        echo '</tbody>';
        ?>
        
        <tfoot>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th>Total</th>
                <td style="font-size: 14px; font-weight:bold;text-align:right;"><?php echo number_format($qty); ?></td>
                <td style="font-size: 14px; font-weight:bold;text-align:right;"><?php echo $curr_symbol.number_format($total_price,2); ?></td>
                
            </tr>
        </tfoot>
        </table>     
    </div>
    
    <hr />
</div>
 
<?php } ?>