<div class="row">
    <div class="col-sm-12">
        <?php
        if ($this->session->flashdata('message')) {
            echo "<div class='alert alert-success fade in'>";
            echo $this->session->flashdata('message');
            echo '</div>';
        }
        ?>
        <div class="row">
            <div class="col-sm-12">
                <?php echo anchor('hr_finance/C_positions/create', lang('add_new') . ' <i class="fa fa-plus"></i>', 'class="btn btn-success"'); ?>
            </div>
        </div>
        </br>

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

                <table class="table table-bordered table-striped table-condensed flip-content" id="sample_2">
                    <thead class="flip-content">
                        <tr>
                            <th>ID</th>
                            <th><?php echo lang('name'); ?></th>
                            <th>Note</th>
                            <th><?php echo lang('action'); ?></th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php
                        foreach ($positions as $key => $list) {
                            echo '<tr valign="top">';
                            echo '<td>' . $list['id'] . '</td>';
                            echo '<td>' . $list['name'] . '</td>';
                            echo '<td>'.$list['note'].'</td>';

                            echo '<td>' . anchor('hr_finance/C_positions/edit/' . $list['id'], '<i class="fa fa-pencil-square-o fa-fw"></i>') . ' | ';
                            echo  anchor('hr_finance/C_positions/delete/' . $list['id'], ' <i class="fa fa-trash-o fa-fw"></i>', 'onclick="return confirm(\'Are you sure you want to delete?\')"') . '</td>';
                            echo '</tr>';
                        }
                        echo '</tbody> </table>';

                        ?>

            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->