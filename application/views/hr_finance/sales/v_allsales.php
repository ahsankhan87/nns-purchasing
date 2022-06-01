<div class="row">
    <div class="col-sm-12">
        <?php
        if ($this->session->flashdata('message')) {
            echo "<div class='alert alert-success fade in'>";
            echo $this->session->flashdata('message');
            echo '</div>';
        }
        if ($this->session->flashdata('error')) {
            echo "<div class='alert alert-danger fade in'>";
            echo $this->session->flashdata('error');
            echo '</div>';
        }
        ?>

        <p>
            <!-- <div class="btn-group">
            <button type="button" class="btn btn-success"><?php echo lang('new') . ' ' . lang('transaction') ?></button>
            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
            <ul class="dropdown-menu" role="menu">
                <li>
                    <?php echo anchor('hr_finance/C_sales/index/cash', lang('cash') . ' ' . lang('sales'), 'class="hidden-print"'); ?>
                </li>
                <li>
                    <?php echo anchor('hr_finance/C_sales/index/credit', lang('credit') . ' ' . lang('sales'), 'class="hidden-print"'); ?>
                </li>
                <li>
                    <?php echo anchor('hr_finance/C_sales/index/cashReturn', lang('cash') . ' ' . lang('return'), 'class="hidden-print"'); ?>
                </li>
                <li>
                    <?php echo anchor('hr_finance/C_sales/index/creditReturn', lang('credit') . ' ' . lang('return'), 'class="hidden-print"'); ?>
                </li>
            </ul>
        </div>
        </p> -->
            <?php echo anchor('hr_finance/C_sales/index/cash', 'Add New ' . lang('transaction'), 'class="btn btn-success" id="sample_editable_1_new"'); ?>

        <div class="portlet">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i><span id="print_title"><?php echo $title; ?></span>
                </div>
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a>
                    <a href="#portlet-config" data-toggle="modal" class="config"></a>
                    <a href="javascript:;" class="reload"></a>
                    <a href="javascript:;" class="remove"></a>
                </div>
            </div>
            <div class="portlet-body flip-scroll">

                <table class="table table-striped table-bordered table-condensed flip-content" id="sample_1">
                    <thead class="flip-content">
                        <tr>
                            <th>S.No</th>
                            <th><?php echo lang('date') ?></th>
                            <th>Invoice</th>
                            <th><?php echo lang('customer') ?></th>
                            <th>Payment Terms</th>
                            <th class="text-right"><?php echo lang('amount') ?></th>
                            <th class="hidden-print">Delivery Date</th>
                            <th class="text-right"><?php echo lang('balance') ?></th>
                            <th>Last Payment Date</th>
                            <th>Status</th>
                            <th>Note</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <?php
                        $sno = 1;
                        $total_balance = 0;
                        $total_amount = 0;
                        foreach ($sales as $key => $list) {
                            $total_balance += $list['balance'];
                            $total_amount += $list['total_amount'];

                            echo '<tr>';
                            //echo '<td>'.form_checkbox('p_id[]',$list['id'],false).'</td>';
                            //echo '<td><a href="'.site_url('hr_finance/C_sales/receipt/'.$list['invoice_no']).'" class="hidden-print">'.$list['invoice_no'].'</a></td>';
                            echo '<td>'.$sno++.'</td>';
                            echo '<td>' . date('m/d/Y', strtotime($list['sale_date'])) . '</td>';
                            // echo '<td><a href="'.site_url('hr_finance/C_sales/detail/'.$list['invoice_no']).'">'.date('m/d/Y', strtotime($list['sale_date'])).'</a></td>';
                            echo '<td><a href="'.site_url('hr_finance/C_sales/detail/'.$list['invoice_no']).'">'.$list['invoice_no'].'</a></td>';
                            // echo '<td>' . $list['invoice_no'] . '</td>';
                            $name = $this->M_prod_customers->get_prod_customerName($list['customer_id']);
                            echo '<td>'.anchor('production/C_customers/payment_detail/'.$list['customer_id'],'<span class="">'.$name.'</span>', '').'</td>';

                            echo '<td>' . $list['payment_terms'] . '</td>';
                            echo '<td>₱' . number_format($list['total_amount'],2) . '</td>';
                            echo '<td>' . date('m/d/Y', strtotime($list['delivery_date'])) . '</td>';
                            echo '<td>₱' . number_format($list['balance'],2) . '</td>';
                            echo '<td></td>';
                            
                            if($list['status'] == 'Paid'){
                                $label = "label label-success";
                            }else {
                                $label = "label label-danger";
                            }

                            echo '<td> <span class="'.$label.'">' . $list['status'] . '</span></td>';
                            echo '<td>'.anchor('#','<span class="">View</span>', ' data-toggle="modal" data-target="#view_sales_'.$sno.'"').'</td>';
                            echo '<td>';
                            echo  anchor('hr_finance/C_sales/delete/'.$list['invoice_no'],' <i class="fa fa-trash-o fa-fw"></i>','onclick="return confirm(\'Are you sure you want to delete?\')"');
                            echo '</td>';
                            echo '</tr>';
                            ?>
                            <!--delivery_status_ Modal -->
                            <div class="modal fade" id="view_sales_<?php echo $sno;?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Invoice: <?php echo $list['invoice_no'];?> Sale Note</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p><?php echo $list['description'] ?></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                    </div>
                                    </div>
                                </div>
                            </div>
           
                        <?php
                        }

                        echo '</tbody>';
                        echo '<tfoot>
                                <tr>
                                    <th></th><th></th><th></th>
                                    <th></th><th>Total</th><th>₱'.number_format($total_amount,2).'</th>
                                    <th></th><th>₱'.number_format($total_balance,2).'</th><th></th>
                                    <th></th><th></th><th></th>
                                </tr>
                              </tfoot>';

                        ?>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->