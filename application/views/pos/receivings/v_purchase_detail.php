<div class="row">
    <div class="col-sm-12">
       <?php
        if($this->session->flashdata('message'))
        {
            echo "<div class='alert alert-success fade in'>";
            echo $this->session->flashdata('message');
            echo '</div>';
        }
        if($this->session->flashdata('error'))
        {
            echo "<div class='alert alert-danger fade in'>";
            echo $this->session->flashdata('error');
            echo '</div>';
        }
        ?>
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
            
        <table class="table table-striped table-condensed table-bordered flip-content" id="sample_1">
            <thead class="flip-content">
                        <tr>
                            <th>ID</th>
                            <th>
								 PO#
							</th>
							<th>
								 Product
							</th>
							<th>Qty</th>
							<th>Unit</th>
							
						</tr>
						</thead>
						<tbody>
						    <?php 
						    foreach($receivings_items as $values):
                                echo '<tr>';
                                echo '<td>';
                                echo $values['item_id'];
                                echo '</td>';
                                echo '<td class="text-center">';
                                echo $values['invoice_no'];
                                echo '</td>';
                                echo '<td>';
                                echo $this->M_items->get_itemName($values['item_id']);
                                echo '</td>';
                                echo '<td class="text-center">'.number_format($values['qty']).'</td>';
                                echo '<td class="text-center">';
                                echo $this->M_units->get_unitName($values['unit_id']);
                                echo '</td>';
                                // echo '<td class="text-center">';
                                // echo $values['etd'];
                                // echo '</td>';
                                // echo '<td class="text-center">';
                                // echo $values['eta'];
                                // echo '</td>';
                                // echo '<td class="text-center">';
                                // echo $values['awb'];
                                // echo '</td>'
                                echo '</tr>';
                            endforeach;
						    ?>
						</tbody>
                </table>
                </div>
            </div>
          
        </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->
