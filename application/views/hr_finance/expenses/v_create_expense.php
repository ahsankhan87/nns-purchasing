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
                    
                </select> 
                
            </div>
        
            
            <label class="control-label col-sm-1" for="payment_method">Payment Method:</label>
            <div class="col-sm-3">
                <select class="form-control select2me" id="payment_method" name="payment_method">
                    
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
                    <option value="na">n/a</option>
                </select> 
                <input type="file" name="receipted_file" id="receipted_file">
                
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
            
            <label class="control-label col-sm-1" for="change">Change:</label>
            <div class="col-sm-3">
                <input type="number" class="form-control" name="Change" id="change" readonly="">
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
    
    <?php echo form_submit('', 'Save', 'id="btn_save" class="btn btn-success"'); ?>
    <img src="<?php echo base_url('assets/img/loading.gif')?>" alt="loader" class="loader">
</form>

<script>
    $(document).ready(function() {

        const site_url = '<?php echo site_url($langs); ?>/';
        const path = '<?php echo base_url(); ?>';
        const date = '<?php echo date("Y-m-d") ?>';
        const curr_symbol = "<?php echo $_SESSION["home_currency_symbol"]; ?>";
        const curr_code = "<?php echo $_SESSION["home_currency_code"]; ?>";
        $(".loader").css('display','none');

        $("#expense_form").on("submit", function(e) {
            $(".loader").css('display','block');
            $("#btn_save").attr('disabled','disabled');
            var confirmexpense = confirm('Are you sure you want to save?');
           
            if (confirmexpense) {
                
                var formData = new FormData(this);
                var files = $('#receipted_file')[0].files;
                
                if(files.length > 0){
                    formData.append('receipted_file',files[0]);
                }

                  $.ajax({
                        type: "POST",
                        url: site_url + "hr_finance/C_expenses/expenseProducts",
                        data:formData,
                        cache: false,
                        processData: false,
                        contentType: false,
                        success: function(data) {
                            if(data == '1')
                            {
                                toastr.success("Record saved successfully",'Success');
                                window.location.href = site_url+"hr_finance/C_expenses/allExpenses";
                                clearall_charges();
                                $(".loader").css('display','none');
                            }
                           
                        }
                    });
                
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
                '<td class="text-right"><input type="number" class="form-control unit_price_chr" id="unitpricechr_' + counter_chr + '" name="unit_price_chr[]" step="0.001" autocomplete="off">' +
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
            
                $.ajax({
                url: site_url + "hr_finance/C_expenseItems/expenseItemsDDL",
                type: 'GET',
                dataType: 'json', // added data type
                success: function(data) {
                    //console.log(data);
                    let i = 0;
                    charges_ddl += '<option value="0">Select Item</option>';

                    $.each(data, function(index, value) {

                        charges_ddl += '<option value="' + value.id + '">' + value.name+ '</option>';

                    });

                    $('#chargeid_' + index).html(charges_ddl);

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            });
        }
        ///////////////////
        //GET product DROPDOWN LIST
        function subCategoryDDL(index = 0) {

            let sub_category_ddl = '';
            $.ajax({
                url: site_url + "hr_finance/C_expenseSubCategory/expenseSubCategoryDDL",
                type: 'GET',
                dataType: 'json', // added data type
                success: function(data) {
                    //console.log(data);
                    let i = 0;
                    sub_category_ddl += '<option value="0">Select Sub Category</option>';

                    $.each(data, function(index, value) {

                        sub_category_ddl += '<option value="' + value.id + '">' + value.name+ '</option>';

                    });

                    $('#subcategoryid_' + index).html(sub_category_ddl);

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            });
        }
        ///////////////////
        /////////////ADD NEW LINES END HERE
        
        //GET TOTAL WHEN QTY CHANGE
        $("#amount").on("keyup change", function(e) {
            calc_charges_gtotal();
                
        });
        
        function calc_charges_gtotal() {
            var total_chr = 0;
            var amount = $("#amount").val();
            
            $('.total_chr').each(function() {
                total_chr += parseFloat($(this).val());
            });

            sub_total_charges = (total_chr ? total_chr : 0);
            amount = (amount ? amount : 0);
            
            //ASSIGN VALUE TO TEXTBOXES
            $('#sub_total_txt_charges').val(parseFloat(sub_total_charges).toFixed(2));
            $('#change').val(amount-sub_total_charges);
            /////////////

        }
        ///////////////////////////
        //CHARGES SECTION END HERE
        //////////////////////////
        
        ///////////////////
        paymentforDDL();
        //GET product DROPDOWN LIST
        function paymentforDDL() {

            let paymentfor_ddl = '';
            $.ajax({
                url: site_url + "hr_finance/C_paymentFor/paymentforDDL",
                type: 'GET',
                dataType: 'json', // added data type
                success: function(data) {
                    //console.log(data);
                    let i = 0;
                    paymentfor_ddl += '<option value="0">Please Select</option>';

                    $.each(data, function(index, value) {

                        paymentfor_ddl += '<option value="' + value.id + '">' + value.name+ '</option>';

                    });

                    $('#payment_for').html(paymentfor_ddl);

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            });
        }
        ///////////////////
       
        ///////////////////
        paymentMethodDDL();
        //GET product DROPDOWN LIST
        function paymentMethodDDL() {

            let paymentMethod_ddl = '';
            $.ajax({
                url: site_url + "hr_finance/C_paymentMethod/paymentMethodDDL",
                type: 'GET',
                dataType: 'json', // added data type
                success: function(data) {
                    //console.log(data);
                    let i = 0;
                    paymentMethod_ddl += '<option value="0">Please Select</option>';

                    $.each(data, function(index, value) {

                        paymentMethod_ddl += '<option value="' + value.id + '">' + value.name+ '</option>';

                    });

                    $('#payment_method').html(paymentMethod_ddl);

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            });
        }
        ///////////////////

        ///////////////////
        categoryDDL();
        //GET product DROPDOWN LIST
        function categoryDDL() {

            let category_ddl = '';
            $.ajax({
                url: site_url + "pos/C_categories/categoriesDDL",
                type: 'GET',
                dataType: 'json', // added data type
                success: function(data) {
                    //console.log(data);
                    let i = 0;
                    category_ddl += '<option value="0">Please Select</option>';

                    $.each(data, function(index, value) {

                        category_ddl += '<option value="' + value.id + '">' + value.name+ '</option>';

                    });

                    $('#category_id').html(category_ddl);

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            });
        }
        ///////////////////
    });
</script>