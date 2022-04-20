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
            <?php echo anchor('hr_finance/C_sales/index/cash', 'New ' . lang('transaction'), 'class="btn btn-success" id="sample_editable_1_new"'); ?>


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

                <table class="table table-striped table-bordered table-condensed flip-content" id="sample_2">
                    <thead class="flip-content">
                        <tr>
                            <th>S.No</th>
                            <th><?php echo lang('date') ?></th>
                            <th>Inv #</th>
                            <th><?php echo lang('customer') ?></th>
                            <th>Payment Terms</th>
                            <th class="text-right"><?php echo lang('amount') ?></th>
                            <th class="hidden-print">Delivery Date</th>
                            <th class="text-right"><?php echo lang('balance') ?></th>
                            <th>Last Payment Date</th>
                            <th>Status</th>
                            <th>Note</th>

                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sno = 1;
                        foreach ($sales as $key => $list) {
                            echo '<tr>';
                            //echo '<td>'.form_checkbox('p_id[]',$list['id'],false).'</td>';
                            //echo '<td><a href="'.site_url('hr_finance/C_sales/receipt/'.$list['invoice_no']).'" class="hidden-print">'.$list['invoice_no'].'</a></td>';
                            echo '<td>'.$sno++.'</td>';
                            echo '<td>' . date('m/d/Y', strtotime($list['sale_date'])) . '</td>';
                            echo '<td>' . $list['invoice_no'] . '</td>';
                            $name = $this->M_prod_customers->get_prod_customerName($list['customer_id']);
                            echo '<td>' . @$name . '</td>';
                            echo '<td>' . $list['payment_terms'] . '</td>';
                            echo '<td>' . number_format($list['total_amount'],2) . '</td>';
                            echo '<td>' . date('m/d/Y', strtotime($list['delivery_date'])) . '</td>';
                            echo '<td>' . number_format($list['amount_due'],2) . '</td>';
                            echo '<td></td>';
                            echo '<td>' . $list['status'] . '</td>';
                            echo '<td></td>';
                        }

                        echo '</tbody>';
                        echo '<tfoot>
                                <tr>
                                    <th></th><th></th><th></th>
                                    <th></th><th></th>
                                    <th></th>
                            
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