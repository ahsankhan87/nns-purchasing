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

        <div class="row">
            <div class="col-sm-12">
                <?php echo anchor('hr_finance/C_expenses/index/cash',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success"'); ?>
            </div>
        </div>
        </br>
        
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
                            <th>Date Issued</th>
                            <th>Payment For:</th>
                            <th>Category</th>
                            <th class="text-right"><?php echo lang('amount') ?></th>
                            <th class="text-right">Change</th>
                            <th class="text-right"><?php echo lang('total') ?></th>
                            <th>Payment Method</th>
                            <th>Approval</th>
                            <th>Receipted</th>
                            <th>Cross Checked</th>
                            <th>Note</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <?php
                        $sno = 1;
                        $net_total = 0;
                        $total=0;
                        foreach ($expenses as $key => $list) {
                            echo '<tr>';
                            //echo '<td>'.form_checkbox('p_id[]',$list['id'],false).'</td>';
                            //echo '<td><a href="'.site_url('hr_finance/C_expenses/receipt/'.$list['invoice_no']).'" class="hidden-print">'.$list['invoice_no'].'</a></td>';
                            echo '<td>'.$sno++.'</td>';
                            echo '<td>' . date('m/d/Y', strtotime($list['date_issued'])) . '</td>';
                            echo '<td><a href="'.site_url('hr_finance/C_expenses/allPaymentFor/'.$list['payment_for']).'">'.$list['payment_for'].'</a></td>';
                            echo '<td>' . $list['category'] . '</td>';
                            echo '<td>₱' . number_format($list['amount'],2) . '</td>';
                            echo '<td>₱' . number_format($list['change'],2) . '</td>';
                            $total = (double) $list['amount'] - (double)$list['change'];
                            //echo '<td>' . number_format($total,2) . '</td>';
                            echo '<td><a href="'.site_url('hr_finance/C_expenses/detail/'.$list['id']).'">₱'.number_format($total,2).'</a></td>';
                            echo '<td>' . $list['payment_method'] . '</td>';
                            echo '<td>' . $list['approval'] . '</td>';
                            echo '<td>' . $list['receipted'] . '</td>';
                            echo '<td>' . $list['cross_checked'] . '</td>';
                            echo '<td>' . $list['note'] . '</td>';
                            echo '</tr>';
                        }
                        $net_total +=$total;
                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th></th><th></th><th></th>
                            <th></th><th></th><th></th>
                            <th></th><th></th><th></th>
                            <th></th><th></th><th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->