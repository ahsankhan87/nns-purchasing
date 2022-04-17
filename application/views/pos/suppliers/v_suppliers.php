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
        <div class="row">
    		<div class="col-md-6">
    				<?php echo anchor('pos/C_suppliers/create',lang('add_new').' <i class="fa fa-plus"></i>','class="btn btn-success" id="sample_editable_1_new"'); ?>
                    <?php //echo anchor('pos/Suppliers/SupplierImport','Import Suppliers','class="btn btn-success"'); ?>
  		  	</div>
        </div>
        </br>
        
        <div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i><span id="print_title"><?php echo $main; ?></span>
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
                <th>id</th>
                <th><?php echo lang('name'); ?></th>
                <?php if(@$_SESSION['multi_currency'] == 1){
                echo '<th>Currency</th>';
                }
                ?>
                <th><?php echo lang('email'); ?></th>
                <th><?php echo lang('contact'); ?></th>
                <th>Contact Person</th>
                <th>Country</th>
                <th><?php echo lang('action'); ?></th>
            </tr>
        </thead>
        <?php
        if(count($suppliers))
        {
        ?>
        <tbody>
        <?php
        $sno=1;
        foreach($suppliers as $key => $list)
        {
            $exchange_rate = ($list['exchange_rate'] == 0 ? 1 : $list['exchange_rate']);
            
            echo '<tr>';
            //echo '<td>'.form_checkbox('p_id[]',$list['id'],false).'</td>';
            echo '<td>'.$list['id'].'</td>';
            //echo '<td>'.$sno++.'</td>';
           // echo '<td><img src="'.base_url('images/supplier-images/thumbs/'.$list['supplier_image']).'" width="40" height="40"/></td>';
            //echo '<td>'.$list['account_code'].'</td>';
            //echo '<td><a href="'.site_url('accounts/C_ledgers/ledgerDetail/'. $ledger_id).'">'.$name.'</a> </td>';
            //echo '<td><a href="'.site_url('pos/Suppliers/supplierDetail/'. $list['id']).'">'.$list['name'].' </a><a href="mailto:'.$list['email'].'"><i class="fa fa-envelope-o fa-fw"></i></a></td>';
            //echo '<td>'.$list['name'].'</td>';
            echo '<td>'.anchor('pos/C_suppliers/ProductsBySupplier/'.$list['id'],$list['name']).'</td>';
            
            echo '<td class="text-center">'.$list['email'].'</td>';
        
            echo '<td class="text-center">'.$list['contact_no'].'</td>';
            echo '<td class="text-center">'.$list['contact_person'].'</td>';
            echo '<td class="text-center">'.$list['country'].'</td>';
            //OPENING BALANCES
            $op_balance_dr = ($list['op_balance_dr']/$exchange_rate);
            $op_balance_cr = ($list['op_balance_cr']/$exchange_rate);
            $op_balance = (($op_balance_dr-$op_balance_cr)/$exchange_rate);
            
            //CURRENT BALANCES
            //$cur_balance = $this->M_suppliers->get_supplier_total_balance($list['id'],FY_START_DATE,FY_END_DATE);
            $balance_dr = 0; //($cur_balance[0]['dr_balance']/$exchange_rate);
            $balance_cr = 0; //($cur_balance[0]['cr_balance']/$exchange_rate);
            
           // echo '<td>'.round($op_balance_dr+$balance_dr,2).'</td>';
            //echo '<td>'.round($op_balance_cr+$balance_cr,2).'</td>';
          //  echo '<td>'.round(($op_balance_dr+$balance_dr)-($op_balance_cr+$balance_cr),2).'</td>';
           
                    
            
            //echo '<td><a href="'.site_url('pos/Suppliers/paymentModal/'. $list['id']).'" class="btn btn-warning btn-sm">Make Payment</a></td>';
           // echo '<td><button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#supplier-payment-Modal">Make Payment</button></td>';
            
            echo '<td>';
            //echo  anchor(site_url('up_supplier_images/upload_images/'.$list['id']),' upload Images');
        ?>
        <?php echo anchor('pos/C_suppliers/edit/'.$list['id'],'<i class="fa fa-pencil-square-o fa-fw"></i>','title="Edit"'); ?> | 
        <a href="<?php echo site_url('pos/C_suppliers/delete/'.$list['id'].'/'.$op_balance_dr.'/'.$op_balance_cr) ?>" onclick="return confirm('Are you sure you want to permanent delete supplier and his account transactions?')" title="Permanent Delete"><i class="fa fa-trash-o fa-fw"></i></a>
         
        <?php
            echo '</td>';
            echo '</tr>';
        }
        echo '</tbody>';
        // echo '<tfoot>
        //         <tr>
        //             <th></th><th></th><th></th>
        //             <th></th><th></th><th></th>
                    
        //         </tr>
        //     </tfoot>';
        
        
        }
        ?>
        </table>
            </div>
		</div>
    </div>
    <!-- /.col-sm-12 -->
</div>
<!-- /.row -->