<form id="expense_form" action="">
    <div class="row">
        <div class="col-sm-12">

            <label class="control-label col-sm-1" for="date_issued">Date Issued:</label>
            <div class="col-sm-3">
                <input type="date" class="form-control" id="date_issued" name="date_issued" value="<?php echo date("Y-m-d") ?>" />
            </div>

            <label class="control-label col-sm-1" for="payment_for">Payment For:</label>
            <div class="col-sm-3">
                <select class="form-control select2me" id="payment_for" name="payment_for">
                    <option value="DHL">DHL</option>
                    <option value="Payroll">Payroll</option>
                </select> 
                
            </div>
        
            
            <label class="control-label col-sm-1" for="payment_method">Payment Method:</label>
            <div class="col-sm-3">
                <select class="form-control select2me" id="payment_method" name="payment_method">
                    <option value="Cash">Cash</option>
                    <option value="Bank Transfer">Bank Transfer</option>
                    <option value="Gcash">Gcash</option>
                </select> 
                
            </div>
        </div>
        <!-- /.col-sm-12 -->
        
    </div>
    <div class="row">
        <div class="col-sm-12">

            <label class="control-label col-sm-1" for="category_id">Category:</label>
            <div class="col-sm-3">
                <select class="form-control select2me" id="category_id" name="category_id">
                    <option value="Logistics">Logistics</option>
                    <option value="Operations">Operations</option>
                </select> 
            </div>

            <label class="control-label col-sm-1" for="Approval">Approval:</label>
            <div class="col-sm-3">
                <select class="form-control select2me" id="approval" name="approval">
                    <option value="STI">STI</option>
                    <option value="GM">GM</option>
                    <option value="OM">OM</option>
                </select> 
                
            </div>

          
            <label class="control-label col-sm-1" for="receipted">Receipted:</label>
            <div class="col-sm-3">
                <select class="form-control select2me" id="receipted" name="receipted">
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select> 
                
            </div>
           
        </div>
        <!-- /.col-sm-12 -->
    </div>
    
    <div class="row">
        <div class="col-sm-12">
            <label class="control-label col-sm-1" for="cross_checked">Cross Checked:</label>
            <div class="col-sm-3">
                <select class="form-control select2me" id="cross_checked" name="cross_checked">
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select> 
                
            </div>
            <label class="control-label col-sm-1" for="">Note:</label>
            <div class="col-sm-3">
                <textarea name="description" id="description" class="form-control" ></textarea>
            </div>

            <label class="control-label col-sm-1" for="">Amount:</label>
            <div class="col-sm-3">
                <input type="number" class="form-control" name="amount" id="amount">
            </div>
        </div>
        <!-- /.col-sm-12 -->
        
    </div>
    
    <hr />
    <div class="row">
        <div class="col-sm-12">
        <?php $i = 1; ?>
            <table class="table table-striped table-bordered" id="charges_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Item</th>
                        <!-- <th>Description</th> -->
                        <!-- <th>Quantity</th> -->
                        <th>Value</th>
                        <th>Sub Category</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="create_charges_table">

                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"  class="text-left">
                            <a href="#" class="btn btn-info btn-sm add_new_charges" name="add_new">Add lines</a>
                            <a href="#" class="btn btn-info btn-sm clear_all_charges" name="clear_all">Clear all</a>
                            <!-- <textarea name="description" id="description" class="form-control" placeholder="Description" cols="5" rows="6"></textarea> -->
                        </td>
                        <th class="text-right">Total</th>
                        <!-- <th class="text-right" id="sub_total">0.00</th> -->
                        <th><input type="text" name="sub_total_charges" class="form-control text-right" id="sub_total_txt_charges" readonly="" value=""></th>
                    </tr>
                    <!-- <tr>
                    
                        <th class="text-right" >Discount</th>
                        <th class="text-right" id="total_discount">0.00</th>
                        <th><input type="hidden" name="total_discount" id="total_discount_txt" value=""></th>
                    </tr>
                    <tr>
                        <th class="text-right">Tax</th>
                        <th class="text-right" id="total_tax">0.00</th>
                        <th><input type="hidden" name="total_tax" id="total_tax_txt" value=""></th>
                    </tr> -->
                    <!-- <tr>
                        <th colspan="5"><?php echo form_submit('', 'Save', 'class="btn btn-success"'); ?></th>
                        <th class="text-right" >Grand Total</th>
                        <th class="text-right lead" id="net_total">0.00</th>
                        <th><input type="hidden" name="net_total" id="net_total_txt" value=""></th>
                    </tr> -->
                </tfoot>
            </table>
            
        </div>
        
    </div><!-- close here -->
    
    <?php echo form_submit('', 'Save', 'class="btn btn-success"'); ?>
</form>

<script>
    $(document).ready(function() {

        const site_url = '<?php echo site_url($langs); ?>/';
        const path = '<?php echo base_url(); ?>';
        const date = '<?php echo date("Y-m-d") ?>';
        const curr_symbol = "<?php echo $_SESSION["home_currency_symbol"]; ?>";
        const curr_code = "<?php echo $_SESSION["home_currency_code"]; ?>";
        
        
        $("#expense_form").on("submit", function(e) {
            var formValues = $(this).serialize();
            console.log(formValues);
            // alert(formValues);
            // return false;
           
            var confirmexpense = confirm('Are you absolutely sure you want to expense?');
           
            if (confirmexpense) {
                
                if(formValues.length > 0)
                {
                   $.ajax({
                        type: "POST",
                        url: site_url + "hr_finance/C_expenses/expenseProducts",
                        data: formValues,
                        success: function(data) {
                            if(data == '1')
                            {
                                toastr.success("Invoice saved successfully",'Success');
                                
                            }
                            clearall();
                            console.log(data);
                        }
                    });
                }
            }
            e.preventDefault();
        });

        ////
        customerDDL();
        ////////////////////////
        //GET customer DROPDOWN LIST
        function customerDDL() {

        let customer_ddl = '';
        $.ajax({
            url: site_url + "production/C_customers/CustomersDDL",
            type: 'GET',
            dataType: 'json', // added data type
            success: function(data) {
                //console.log(data);
                let i = 0;
                customer_ddl += '<option value="0">Select Customer</option>';

                $.each(data, function(index, value) {

                    customer_ddl += '<option value="' + value.id + '">' + value.name+ '</option>';

                });

                $('#customer_id').html(customer_ddl);

            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.status);
                console.log(thrownError);
            }
        });
        }
        
        ///////////////////////////
        //CHARGES SECTION END HERE
        //////////////////////////
        /////////////ADD NEW LINES
        let counter_chr = 0; //counter is used for id of the debit / credit textbox to enable and disable 8 textboxs already used so start from 8 here
        $('.add_new_charges').on('click', function(event) {
            event.preventDefault();
            counter_chr++;
            
            var div = '<tr><td>' + counter_chr + '</td>' +
                '<td width="25%"><select  class="form-control charge_id" id="chargeid_' + counter_chr + '" name="charge_id[]"></select></td>' +
                //'<td class="text-right"><input type="text"  class="form-control description_chr" id="descriptionchr_' + counter_chr + '" name="description_chr[]" value="" ></td>' +
                //'<td class="text-right" width="10%"><input type="number" min="1" class="form-control qty_chr" id="qtychr_' + counter_chr + '" name="qty_chr[]" value="1" autocomplete="off"></td>' +
                '<td class="text-right"><input type="number" class="form-control unit_price_chr" id="unitpricechr_' + counter_chr + '" name="unit_price_chr[]" autocomplete="off">' +
                '<td width="20%"><select  class="form-control subcategory_id" id="subcategoryid_' + counter_chr + '" name="subcategory_id[]"></select></td>' +
                '<td class=""> <input type="number" class="form-control text-right total_chr" id="totalchr_' + counter_chr + '" name="total_chr[]" readonly=""></td>' +
                '<td><i id="removeItem" class="fa fa-trash-o fa-1x"  style="color:red;"></i></td></tr>';
            $('.create_charges_table').append(div);

            chargesDDL(counter_chr);
            subCategoryDDL(counter_chr);
            //SELECT 2 DROPDOWN LIST   
            $('#chargeid_' + counter_chr).select2();
            $('#subcategoryid_' + counter_chr).select2();
            ///

            //GET TOTAL WHEN UNIT PRICE CHANGE
            $(".unit_price_chr").on("keyup change", function(e) {
                var curId = this.id.split("_")[1];
                var price = parseFloat($(this).val());
                var total = (price ? price : 0).toFixed(2);
                $('#totalchr_' + curId).val(total);

                calc_charges_gtotal();
            });
            
        });
        $(".add_new_charges").trigger("click"); //ADD NEW LINE WHEN PAGE LOAD BY DEFAULT

        /////////////////////////////////
        $("#charges_table").on("click", "#removeItem", function() {
            $(this).closest("tr").remove();
            calc_charges_gtotal();
        });

        ////////// CLEAR ALL TABLE
        $(".clear_all_charges").on("click", function() {
            clearall_charges();
        });
        
        function clearall_charges()
        {
            counter_chr = 0;
            calc_charges_gtotal();
            $('#sub_total_charges').html(parseFloat('0').toFixed(2));
            $("#charges_table > tbody").empty();
            
            $(".add_new_charges").trigger("click");//add new line
        }

        ///////////////////
        // chargesDDL();
        ////////////////////////
        //GET product DROPDOWN LIST
        function chargesDDL(index = 0) {

            let charges_ddl = '';
            charges_ddl += '<option value="0">Select Charges</option>';
            charges_ddl += '<option value="1">Charge 1</option>';
            charges_ddl += '<option value="2">Charge 2</option>';
            charges_ddl += '<option value="3">Charge 3</option>';
            $('#chargeid_' + index).html(charges_ddl);
           
        }
        ///////////////////
        //GET product DROPDOWN LIST
        function subCategoryDDL(index = 0) {

        let sub_category_ddl = '';
        sub_category_ddl += '<option value="0">Select Category</option>';
        sub_category_ddl += '<option value="1">Charge 1</option>';
        sub_category_ddl += '<option value="2">Charge 2</option>';
        sub_category_ddl += '<option value="3">Charge 3</option>';
        $('#subcategoryid_' + index).html(sub_category_ddl);

        }
        ///////////////////
        /////////////ADD NEW LINES END HERE

        function calc_charges_gtotal() {
            var total_chr = 0;
            var net_total = 0;

            $('.total_chr').each(function() {
                total_chr += parseFloat($(this).val());
            });

            sub_total_charges = (total_chr ? total_chr : 0);

            //ASSIGN VALUE TO TEXTBOXES
            $('#sub_total_txt_charges').val(parseFloat(sub_total_charges).toFixed(2));
            //$('#total_discount_txt').val(parseFloat(total_discount));
            //$('#total_tax_txt').val(parseFloat(total_tax));
            // $('#net_total_txt').val(parseFloat(net_total));
            /////////////

        }
        ///////////////////////////
        //CHARGES SECTION END HERE
        //////////////////////////
        
        
    });
</script>