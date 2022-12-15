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
                        // var_dump($expenses);
                        foreach ($expenses_by_category as $key => $list) {
                            echo '<tr>';
                            //echo '<td>'.form_checkbox('p_id[]',$list['id'],false).'</td>';
                            //echo '<td><a href="'.site_url('hr_finance/C_expenses/receipt/'.$list['invoice_no']).'" class="hidden-print">'.$list['invoice_no'].'</a></td>';
                            echo '<td>'.$sno++.'</td>';
                            echo '<td>' . date('m/d/Y', strtotime($list['date_issued'])) . '</td>';
                            echo '<td>' . $this->M_paymentfor->get_paymentforName($list['payment_for_id']) . '</td>';
                            echo '<td>' . $this->M_category->get_CatNameByItem($list['category_id']) . '</td>';
                            echo '<td>₱' . number_format($list['amount'],2) . '</td>';
                            echo '<td>₱' . number_format($list['change'],2) . '</td>';
                            $total = (double) $list['amount'] - (double)$list['change'];
                            //echo '<td>' . number_format($total,2) . '</td>';
                            echo '<td><a href="'.site_url('hr_finance/C_expenses/detail/'.$list['id']).'">₱'.number_format($total,2).'</a></td>';
                            echo '<td>' . $this->M_paymentMethod->get_paymentMethodName($list['payment_method_id']) . '</td>';
                            echo '<td>' . $list['approval'] . '</td>';
                            $label_1 = ($list['receipted'] == "Yes" ? 'label label-success': 'label label-danger');
                            $label_2 = ($list['cross_checked'] == "Yes" ? 'label label-success': 'label label-danger');
                            
                            if($list['receipted_file'] != "")
                            {
                                echo '<td><a href="'.base_url('images/expenses/'.$list['receipted_file']).'" target="_blank" class="'.$label_1.'">'.$list['receipted'].'</a></td>';
                            }else{
                                echo '<td><span class="'.$label_1.'" title="no file">' . $list['receipted'] . '</span></td>';

                            }
                            echo '<td><span class="'.$label_2.'">' . $list['cross_checked'] . '</span></td>';
                            echo '<td>' . $list['note'] . '</td>';
                            echo '</tr>';

                            $net_total +=$total;
                        }

                        echo '';

                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th></th><th></th><th></th>
                            <th></th><th></th><th>Total</th>
                            <th>₱<?php echo number_format($net_total,2); ?></th><th></th><th></th>
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
<style>
    .red_color{
        background-color: red;
        color:#fff;
    }
    .green_color{
        background-color: green;
        color:#fff;
    }
</style>