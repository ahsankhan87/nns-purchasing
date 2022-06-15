<form id="sale_form" action="">
    <div class="row">
        <div class="col-sm-8">

            <label class="control-label col-sm-2" for="sale_date">Date:</label>
            <div class="col-sm-4">
                <input type="date" class="form-control" id="sale_date" name="sale_date" value="<?php echo date("Y-m-d") ?>" />
            </div>
            
            <label class="control-label col-sm-2" for="invoice_no">Invoice No.:</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="invoice_no" name="invoice_no" required="" value="" />
            </div>
        </div>
        <!-- /.col-sm-12 -->
        
        <div class="col-sm-4">
            <label class="control-label col-sm-5" for="payment_terms">Payment Terms:</label>
            <div class="col-sm-7">
                <select class="form-control select2me" id="payment_terms" name="payment_terms">
                   
                </select> 
                
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-sm-8">

            <label class="control-label col-sm-2" for="delivery_date">Delivery Date:</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="delivery_date" name="delivery_date" value="" />
            </div>
            
            <label class="control-label col-sm-2" for="">Customer:</label>
            <div class="col-sm-4">
                <select id="customer_id" name="customer_id" class="form-control select2me"></select>
                <!-- <?php echo form_dropdown('customer_id', $customersDDL, '', 'id="customer_id" class="form-control select2me"'); ?> -->
                <!-- <br><?php echo anchor('#', 'Add New <i class="fa fa-plus"></i>', ' data-toggle="modal" data-target="#customerModal"'); ?> -->
            </div>

        </div>
        <!-- /.col-sm-12 -->
        
        <div class="col-sm-4">
            
            <label class="control-label col-sm-5" for="status">Status:</label>
            <div class="col-sm-7">
                <select class="form-control select2me" id="status" name="status">
                    <option value="Paid">Paid</option>
                    <option value="Unpaid">Unpaid</option>
                </select> 
                
            </div>
           
        </div>

    </div>
    <div class="row">
        <div class="col-sm-8">

            <label class="control-label col-sm-2" for="">Note:</label>
            <div class="col-sm-4">
                <textarea name="description" id="description" class="form-control" ></textarea>
            </div>

        </div>
        <!-- /.col-sm-12 -->
        
        <div class="col-sm-4 text-right">
            
        </div>

    </div>
    <hr />
    <div class="lead">Order Details</div>
    <div class="row">
        <div class="col-sm-12">
        <?php $i = 1; ?>
            <table class="table table-striped table-bordered" id="sale_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Products</th>
                        <th>Content</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Unit</th>
                        <th>Amount</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="create_table">

                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5"  class="text-left">
                            <a href="#" class="btn btn-info btn-sm add_new" name="add_new">Add lines</a>
                            <a href="#" class="btn btn-info btn-sm clear_all" name="clear_all">Clear all</a>
                            <!-- <textarea name="description" id="description" class="form-control" placeholder="Description" cols="5" rows="6"></textarea> -->
                        </td>
                        <th class="text-right">Products Total ₱:</th>
                        <!-- <th class="text-right" id="sub_total">0.00</th> -->
                        <th><input type="text" name="sub_total" class="form-control text-right" id="sub_total_txt" readonly="" value=""></th>
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
    <hr />
    <div class="row">
        <div class="col-sm-12">
        <?php $i = 1; ?>
            <table class="table table-striped table-bordered" id="charges_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Charges</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Amount</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="create_charges_table">

                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4"  class="text-left">
                            <a href="#" class="btn btn-info btn-sm add_new_charges" name="add_new">Add lines</a>
                            <a href="#" class="btn btn-info btn-sm clear_all_charges" name="clear_all">Clear all</a>
                            <!-- <textarea name="description" id="description" class="form-control" placeholder="Description" cols="5" rows="6"></textarea> -->
                        </td>
                        <th class="text-right">Charges Total ₱:</th>
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
    <hr />

    <div class="row">
        <div class="col-sm-12">
        <?php $i = 1; ?>
            <table class="table table-striped table-bordered" id="deduction_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Deductions</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Amount</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="create_deduction_table">

                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4"  class="text-left">
                            <a href="#" class="btn btn-info btn-sm add_new_deduction" name="add_new">Add lines</a>
                            <a href="#" class="btn btn-info btn-sm clear_all_deduction" name="clear_all">Clear all</a>
                            <!-- <textarea name="description" id="description" class="form-control" placeholder="Description" cols="5" rows="6"></textarea> -->
                        </td>
                        <th class="text-right">Deduction Total ₱:</th>
                        <!-- <th class="text-right" id="sub_total">0.00</th> -->
                        <th><input type="text" name="sub_total_deduction" class="form-control text-right" id="sub_total_txt_deduction" readonly="" value=""></th>
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
            <div id="top_net_total" class="text-right"></div>
            <table class="table table-striped table-bordered">
                <tbody>
                    <tr>
                        <th></th><th></th><th></th><th></th>
                        <th colspan="4"  class="text-right">
                        </th>
                        <th class="text-right">Grand Total ₱:</th>
                        <!-- <th class="text-right" id="sub_total">0.00</th> -->
                        <th><input type="text" name="grand_total" class="form-control text-right" id="grand_total" readonly="" value=""></th>
                    </tr>
                   
                </tbody>
            </table>
        </div>
    </div><!-- close here -->

    <hr />
    <div class="row">
        <div class="col-sm-12">
        <div class="lead">Summary of Payments</div>
        <?php $i = 1; ?>
            <table class="table table-striped table-bordered" id="payment_summary_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Amount</th>
                        <th>Payment Terms</th>
                        <th>Payment Date</th>
                        <th>Status</th>
                        <th>Payment Method</th>
                        <th>Payment Method</th>
                        <th>Note</th>
                    </tr>
                </thead>
                <tbody class="payment_summary_table">

                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4"  class="text-left">
                            <a href="#" class="btn btn-info btn-sm add_new_payment_summary" name="add_new">Add lines</a>
                            <a href="#" class="btn btn-info btn-sm clear_all_payment_summary" name="clear_all">Clear all</a>
                            <!-- <textarea name="description" id="description" class="form-control" placeholder="Description" cols="5" rows="6"></textarea> -->
                        </td>
                        <!-- <th class="text-right">Payment Summary Total ₱:</th>
                        <th class="text-right" id="sub_total">0.00</th>
                        <th><input type="text" name="sub_total_payment_summary" class="form-control text-right" id="sub_total_txt_charges" readonly="" value=""></th> -->
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

    <?php echo form_submit('', 'Save & New', 'class="btn btn-success"'); ?>
</form>
<!-- Modal -->
<div class="modal fade" id="customerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add new customer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="customerForm" action="">
                    
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Name:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="name" id="name" placeholder="Enter Name" required="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Store Name:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="store_name" id="store_name" placeholder="Enter Store Name" required="">

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Email:</label>
                        <div class="col-sm-9">
                            <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="phone_no">Phone No:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="phone_no" id="phone_no" placeholder="Enter phone no">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="website">Website:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="website" id="website" placeholder="Enter website">
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        </form>
    </div>
</div>

<script>
    $(document).ready(function() {

        const site_url = '<?php echo site_url($langs); ?>/';
        const path = '<?php echo base_url(); ?>';
        const date = '<?php echo date("Y-m-d") ?>';
        const curr_symbol = "<?php echo $_SESSION["home_currency_symbol"]; ?>";
        const curr_code = "<?php echo $_SESSION["home_currency_code"]; ?>";
        
        /////////////ADD NEW LINES
        let counter = 0; //counter is used for id of the debit / credit textbox to enable and disable 8 textboxs already used so start from 8 here
        $('.add_new').on('click', function(event) {
            event.preventDefault();
            counter++;
            productDDL(counter);
            UnitsDDL(counter);

            var div = '<tr><td>' + counter + '</td>' +
                '<td width="25%"><select  class="form-control product_id" id="productid_' + counter + '" name="product_id[]"></select></td>' +
                '<td class="text-right"><input type="text"  class="form-control content" id="content_' + counter + '" name="content[]" value="" readonly="" ></td>' +
                '<td class="text-right" width="10%"><input type="number" min="1" class="form-control qty" id="qty_' + counter + '" name="qty[]" value="1" autocomplete="off"></td>' +
                '<td class="text-right"><input type="number" class="form-control unit_price" id="unitprice_' + counter + '" name="unit_price[]" autocomplete="off">' +
                '<input type="hidden" cost_price" id="costprice_' + counter + '" name="cost_price[]">'+
                '<input type="hidden" item_type" id="itemtype_' + counter + '" name="item_type[]"></td>'+
                '<input type="hidden" tax_id" id="taxid_' + counter + '" name="tax_id[]"></td>'+
                '<input type="hidden" tax_rate" id="taxrate_' + counter + '" name="tax_rate[]"></td>'+
                // '<td class="text-right tax" id="tax_' + counter + '"></td>' +
                '<td width="20%"><select  class="form-control unit_id" id="unitid_' + counter + '" name="unit_id[]"></select></td>' +
                '<td class=""> <input type="number" class="form-control text-right total" id="total_' + counter + '" name="total[]" readonly=""></td>' +
                '<td><i id="removeItem" class="fa fa-trash-o fa-1x"  style="color:red;"></i></td></tr>';
            $('.create_table').append(div);

            //SELECT 2 DROPDOWN LIST   
            $('#productid_' + counter).select2();
            $('#unitid_' + counter).select2();
            ///

            //GET TOTAL WHEN QTY CHANGE
            $(".qty").on("keyup change", function(e) {
                var curId = this.id.split("_")[1];
                var qty = parseFloat($(this).val());
                var price = parseFloat($('#unitprice_' + curId).val());
                var discount = 0; //(parseFloat($('#discount_' + curId).val()) ? parseFloat($('#discount_' + curId).val()) : 0);
                var total = (qty * price ? qty * price - discount : 0).toFixed(2);
                $('#total_' + curId).val(total);

                calc_gtotal();
            });
            //GET TOTAL WHEN UNIT PRICE CHANGE
            $(".unit_price").on("keyup change", function(e) {
                var curId = this.id.split("_")[1];
                var qty = parseFloat($('#qty_' + curId).val());
                var discount = 0; //(parseFloat($('#discount_' + curId).val()) ? parseFloat($('#discount_' + curId).val()) : 0);
                var price = parseFloat($(this).val());
                var total = (qty * price ? qty * price - discount : 0).toFixed(2);
                $('#total_' + curId).val(total);

                calc_gtotal();
            });
            //GET TOTAL WHEN DISCOUNT CHANGE
            $(".discount").on("keyup change", function(e) {
                var curId = this.id.split("_")[1];
                var qty = parseFloat($('#qty_' + curId).val());
                var price = parseFloat($('#unitprice_' + curId).val());
                var discount = 0;//(parseFloat($('#discount_' + curId).val()) ? parseFloat($('#discount_' + curId).val()) : 0);
                var total = (qty * price ? qty * price - discount : 0).toFixed(2);
                $('#total_' + curId).val(total);

                calc_gtotal();
            });

            ////// LOAD COST PRICE, UNIT PRICE, TAX WHEN PRODUCT DROPDOWN CHANGE
            $('.product_id').on('change', function(event) {
                // event.preventDefault();
                var curId = this.id.split("_")[1];
                var productid = $(this).val();
                var qty = parseFloat($('#qty_' + curId).val());
                var discount = 0; //(parseFloat($('#discount_' + curId).val()) ? parseFloat($('#discount_' + curId).val()) : 0);
                var tax_rate = 0;
                var unit_price = 0;

                $.ajax({
                    url: site_url + "production/C_products/productDDL/" + productid,
                    type: 'GET',
                    dataType: 'json', // added data type
                    success: function(data) {

                        tax_rate = (parseFloat(data[0].tax_rate) ? parseFloat(data[0].tax_rate) : 0);
                        unit_price = parseFloat(data[0].unit_price);
                        tax = unit_price * tax_rate / 100;
                        $('#content_' + curId).val(data[0].content);
                        // $('#unitprice_' + curId).val(data[0].unit_price);
                        // $('#costprice_' + curId).val(data[0].cost_price);
                        // $('#itemtype_' + curId).val(data[0].item_type);
                        // $('#taxid_' + curId).val(data[0].tax_id);
                        // $('#taxrate_' + curId).val(data[0].tax_rate);
                        // $('#tax_' + curId).text(tax.toFixed(2));

                        var total = (qty * unit_price ? qty * unit_price - discount : 0).toFixed(2);
                        $('#total_' + curId).text(total);

                        //console.log((tax ? tax : 0));
                        calc_gtotal();
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        console.log(xhr.status);
                        console.log(thrownError);
                    }
                });


            });

        });
        $(".add_new").trigger("click"); //ADD NEW LINE WHEN PAGE LOAD BY DEFAULT

        /////////////////////////////////
        $("#sale_table").on("click", "#removeItem", function() {
            $(this).closest("tr").remove();
            calc_gtotal();
        });

        ////////// CLEAR ALL TABLE
        $(".clear_all").on("click", function() {
            clearall();
        });
        
        function clearall()
        {
            counter = 0;
            const  date = new Date();
            calc_gtotal();
            $('#sub_total').html(parseFloat('0').toFixed(2));
            //$('#total_discount').html(parseFloat('0').toFixed(2));
            //$('#total_tax').html(parseFloat('0').toFixed(2));
            $('#net_total').html(parseFloat('0').toFixed(2));
            $("#sale_table > tbody").empty();
            $('#top_net_total').html('');
            $('#customer_id').val('').trigger('change');
            $('#payment_terms').val('').trigger('change');
            $('#status').val('').trigger('change');

            $('#business_address').val('');
            $('#description').val('');
            $('#due_date').val();
            $('#invoice_no').val();
            $('#delivery_date').val();

            $(".add_new").trigger("click");//add new line
        }

        ///////////////////
        // productDDL();
        ////////////////////////
        //GET product DROPDOWN LIST
        function productDDL(index = 0) {

            let product_ddl = '';
            $.ajax({
                url: site_url + "production/C_products/productDDL",
                type: 'GET',
                dataType: 'json', // added data type
                success: function(data) {
                    //console.log(data);
                    let i = 0;
                    product_ddl += '<option value="0">Select Product</option>';

                    $.each(data, function(index, value) {

                        product_ddl += '<option value="' + value.id + '">' + value.name + '</option>';

                    });

                    $('#productid_' + index).html(product_ddl);

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            });
        }
        ///////////////////
        /////////////ADD NEW LINES END HERE
        function calc_grand_total() {
            var grand_total = 0;
            var total_ded = 0;
            var total_charges = 0;
            var products_total = 0;

            products_total = $('#sub_total_txt').val();
            total_ded = $("#sub_total_txt_deduction").val();
            total_charges = $("#sub_total_txt_charges").val();
            
            grand_total = (grand_total ? grand_total : 0);
            total_ded  = (total_ded ? total_ded : 0);
            total_charges = (total_charges ? total_charges : 0);

            grand_total = ((parseFloat(products_total) + parseFloat(total_charges)) - parseFloat(total_ded));
            $('#grand_total').val(parseFloat(grand_total));
            $('#net_total').text(parseFloat(grand_total).toLocaleString('en-US', 2));
            $('#top_net_total').html('Grand Total:<h2 style="margin:0">'+parseFloat(grand_total).toLocaleString('en-US', 2)+'</h2>');
            
        }
        function calc_gtotal() {
            var total = 0;
            
            $('.total').each(function() {
                total += parseFloat($(this).val());
            });

            sub_total = (total ? total : 0);

            //ASSIGN VALUE TO TEXTBOXES
            $('#sub_total_txt').val(parseFloat(sub_total).toFixed(2));
            $('#sub_total').text(parseFloat(sub_total).toLocaleString('en-US'));

            calc_grand_total();
        }

        $("#sale_form").on("submit", function(e) {
            var formValues = $(this).serialize();
            console.log(formValues);
            // alert(formValues);
            // return false;
           
            var confirmSale = confirm('Are you sure you want to save?');
           
            if (confirmSale) {
                
                if(formValues.length > 0)
                {
                   $.ajax({
                        type: "POST",
                        url: site_url + "hr_finance/C_sales/saleProducts",
                        data: formValues,
                        success: function(data) {
                            if(data == '1')
                            {
                                toastr.success("Invoice saved successfully",'Success');
                                window.location.href = site_url+"hr_finance/C_sales/allSales";
                            }
                            clearall();
                            clearall_charges();
                            clearall_deduction();
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
        ///////////////////
        $("#customerForm").submit(function(event) {
            // Stop form from submitting normally
            event.preventDefault();

            /* Serialize the submitted form control values to be sent to the web server with the request */
            var formValues = $(this).serialize();

            console.log($('#item_id').val());

             if ($('#name').val() == 0) {
                toastr.error("Please enter name", 'Error!');
            } else {
                // Send the form data using post
                $.post(site_url + "/production/C_customers/create/", formValues, function(data) {
                    // Display the returned data in browser
                    //$("#result").html(data);
                    toastr.success("Data saved successfully", 'Success');
                    console.log(data);
                    $('#customerModal').modal('toggle');
                    customerDDL();
                    // setTimeout(function() {
                    //     location.reload();
                    // }, 2000);

                });
            }
        });
        /////

        ////////////////////////
        //GET Unit DROPDOWN LIST
        function UnitsDDL(index = 0) {

        let Unit_ddl = '';
        $.ajax({
            url: site_url + "pos/C_units/unitsDDL",
            type: 'GET',
            dataType: 'json', // added data type
            success: function(data) {
                //console.log(data);
                let i = 0;
                Unit_ddl += '<option value="0">Select Unit</option>';

                $.each(data, function(index, value) {

                    Unit_ddl += '<option value="' + value.id + '">' + value.name + '</option>';

                });

                $('#unitid_' + index).html(Unit_ddl);

            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.status);
                console.log(thrownError);
            }
        });
        }
        ///////////////////

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
                '<td class="text-right"><input type="text"  class="form-control description_chr" id="descriptionchr_' + counter_chr + '" name="description_chr[]" value="" ></td>' +
                '<td class="text-right" width="10%"><input type="number" min="1" class="form-control qty_chr" id="qtychr_' + counter_chr + '" name="qty_chr[]" value="1" autocomplete="off"></td>' +
                '<td class="text-right"><input type="number" class="form-control unit_price_chr" id="unitpricechr_' + counter_chr + '" name="unit_price_chr[]" autocomplete="off">' +
                '<td class=""> <input type="number" class="form-control text-right total_chr" id="totalchr_' + counter_chr + '" name="total_chr[]" readonly=""></td>' +
                '<td><i id="removeItem" class="fa fa-trash-o fa-1x"  style="color:red;"></i></td></tr>';
            $('.create_charges_table').append(div);

            chargesDDL(counter_chr);
            //SELECT 2 DROPDOWN LIST   
            $('#chargeid_' + counter_chr).select2();
            ///

            //GET TOTAL WHEN QTY CHANGE
            $(".qty_chr").on("keyup change", function(e) {
                var curId = this.id.split("_")[1];
                var qty = parseFloat($(this).val());
                var price = parseFloat($('#unitpricechr_' + curId).val());
                var discount = 0; //(parseFloat($('#discount_' + curId).val()) ? parseFloat($('#discount_' + curId).val()) : 0);
                var total = (qty * price ? qty * price - discount : 0).toFixed(2);
                $('#totalchr_' + curId).val(total);

                calc_charges_gtotal();
            });
            //GET TOTAL WHEN UNIT PRICE CHANGE
            $(".unit_price_chr").on("keyup change", function(e) {
                var curId = this.id.split("_")[1];
                var qty = parseFloat($('#qtychr_' + curId).val());
                var discount = 0; //(parseFloat($('#discount_' + curId).val()) ? parseFloat($('#discount_' + curId).val()) : 0);
                var price = parseFloat($(this).val());
                var total = (qty * price ? qty * price - discount : 0).toFixed(2);
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
                url: site_url + "hr_finance/C_sales_charges/sales_chargesDDL",
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
            /////////////
            calc_grand_total();
        }
        ///////////////////////////
        //CHARGES SECTION END HERE
        //////////////////////////
        
        ///////////////////////////
        //DEDUCTION SECTION END HERE
        //////////////////////////
        /////////////ADD NEW LINES
        let counter_ded = 0; //counter is used for id of the debit / credit textbox to enable and disable 8 textboxs already used so start from 8 here
        $('.add_new_deduction').on('click', function(event) {
            event.preventDefault();
            counter_ded++;
            
            var div = '<tr><td>' + counter_ded + '</td>' +
                '<td width="25%"><select  class="form-control deduction_id" id="deductionid_' + counter_ded + '" name="deduction_id[]"></select></td>' +
                '<td class="text-right"><input type="text"  class="form-control description_ded" id="descriptionded_' + counter_ded + '" name="description_ded[]" value="" ></td>' +
                '<td class="text-right" width="10%"><input type="number" min="1" class="form-control qty_ded" id="qtyded_' + counter_ded + '" name="qty_ded[]" value="1" autocomplete="off"></td>' +
                '<td class="text-right"><input type="number" class="form-control unit_price_ded" id="unitpriceded_' + counter_ded + '" name="unit_price_ded[]" autocomplete="off">' +
                '<td class=""> <input type="number" class="form-control text-right total_ded" id="totalded_' + counter_ded + '" name="total_ded[]" readonly=""></td>' +
                '<td><i id="removeItem" class="fa fa-trash-o fa-1x"  style="color:red;"></i></td></tr>';
            $('.create_deduction_table').append(div);

            deductionDDL(counter_ded);
            
            //SELECT 2 DROPDOWN LIST   
            $('#deductionid_' + counter_ded).select2();
            ///

            //GET TOTAL WHEN QTY CHANGE
            $(".qty_ded").on("keyup change", function(e) {
                var curId = this.id.split("_")[1];
                var qty = parseFloat($(this).val());
                var price = parseFloat($('#unitpriceded_' + curId).val());
                var discount = 0; //(parseFloat($('#discount_' + curId).val()) ? parseFloat($('#discount_' + curId).val()) : 0);
                var total = (qty * price ? qty * price - discount : 0).toFixed(2);
                $('#totalded_' + curId).val(total);

                calc_deduction_gtotal();
            });
            //GET TOTAL WHEN UNIT PRICE CHANGE
            $(".unit_price_ded").on("keyup change", function(e) {
                var curId = this.id.split("_")[1];
                var qty = parseFloat($('#qtyded_' + curId).val());
                var discount = 0; //(parseFloat($('#discount_' + curId).val()) ? parseFloat($('#discount_' + curId).val()) : 0);
                var price = parseFloat($(this).val());
                var total = (qty * price ? qty * price - discount : 0).toFixed(2);
                $('#totalded_' + curId).val(total);

                calc_deduction_gtotal();
            });
            
        });
        $(".add_new_deduction").trigger("click"); //ADD NEW LINE WHEN PAGE LOAD BY DEFAULT

        /////////////////////////////////
        $("#deduction_table").on("click", "#removeItem", function() {
            $(this).closest("tr").remove();
            calc_deduction_gtotal();
        });

        ////////// CLEAR ALL TABLE
        $(".clear_all_deduction").on("click", function() {
            clearall_deduction();
        });
        
        function clearall_deduction()
        {
            counter_ded = 0;
            calc_deduction_gtotal();
            $('#sub_total_deduction').html(parseFloat('0').toFixed(2));
            $("#deduction_table > tbody").empty();
            
            $(".add_new_deduction").trigger("click");//add new line
        }

        ///////////////////
         deductionDDL();
        ////////////////////////
        //GET product DROPDOWN LIST
        function deductionDDL(index = 0) {

            let deduction_ddl = '';
            
            $.ajax({
                url: site_url + "hr_finance/C_sales_deductions/sales_deductionsDDL",
                type: 'GET',
                dataType: 'json', // added data type
                success: function(data) {
                    //console.log(data);
                    let i = 0;
                    deduction_ddl += '<option value="0">Select Deduction</option>';
            
                    $.each(data, function(index, value) {

                        deduction_ddl += '<option value="' + value.id + '">' + value.name+ '</option>';

                    });

                    $('#deductionid_' + index).html(deduction_ddl);

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            });
        }
        ///////////////////
        /////////////ADD NEW LINES END HERE

        function calc_deduction_gtotal() {
            var total_ded = 0;
            var net_total = 0;

            $('.total_ded').each(function() {
                total_ded += parseFloat($(this).val());
            });

            sub_total_deduction = (total_ded ? total_ded : 0);

            //ASSIGN VALUE TO TEXTBOXES
            $('#sub_total_txt_deduction').val(parseFloat(sub_total_deduction).toFixed(2));
            /////////////
            calc_grand_total();
        }
        ///////////////////////////
        //DEDUCTION SECTION END HERE
        //////////////////////////
        
        ////
        payment_termsDDL();
        ////////////////////////
        //GET payment_terms DROPDOWN LIST
        function payment_termsDDL() {

        let payment_terms_ddl = '';
        $.ajax({
            url: site_url + "hr_finance/C_payment_terms/payment_termsDDL",
            type: 'GET',
            dataType: 'json', // added data type
            success: function(data) {
                //console.log(data);
                let i = 0;
                payment_terms += '<option value="0">Payment Terms</option>';

                $.each(data, function(index, value) {

                    payment_terms += '<option value="' + value.id + '">' + value.name+ '</option>';

                });

                $('#payment_terms').html(payment_terms);

            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.status);
                console.log(thrownError);
            }
        });
        }
        ///

        ///////////////////////////
        //payment_summary SECTION END HERE
        //////////////////////////
        /////////////ADD NEW LINES
        let counter_summary = 0; //counter is used for id of the debit / credit textbox to enable and disable 8 textboxs already used so start from 8 here
        $('.add_new_payment_summary').on('click', function(event) {
            event.preventDefault();
            counter_summary++;
            
            var div = '<tr><td>' + counter_summary + '</td>' +
                '<td ><input type="number" min="1" class="form-control amount" id="amount_' + counter_summary + '" name="amount[]"/></td>' +
                '<td><select  class="form-control summary_payment_terms_id" id="summarypaymenttermsid_' + counter_summary + '" name="summary_payment_terms_id[]"></select></td>' +
                '<td><input type="date" min="1" class="form-control payment_date" id="paymentdate_' + counter_summary + '" name="payment_date[]" ></td>' +
                '<td><select  class="form-control summary_status" id="summarystatus_' + counter_summary + '" name="summary_status[]"></select></td>' +
                '<td><select  class="form-control payment_method_id" id="paymentmethodid_' + counter_summary + '" name="payment_method_id[]"></select></td>' +
                '<td><input type="file" class="form-control payment_file" id="paymentfile_' + counter_summary + '" name="payment_file[]"/></td>' +
                '<td><input type="text" class="form-control summary_note" id="summarynote_' + counter_summary + '" name="summary_note[]"/></td>' +
                '<td><i id="removeItem" class="fa fa-trash-o fa-1x"  style="color:red;"></i></td></tr>';
            $('.payment_summary_table').append(div);

            payment_termsDDL_1(counter_summary);
            summary_status(counter_summary);
            //SELECT 2 DROPDOWN LIST   
            $('#amountid_' + counter_summary).select2();
            ///
            
        });
        $(".add_new_payment_summary").trigger("click"); //ADD NEW LINE WHEN PAGE LOAD BY DEFAULT

        /////////////////////////////////
        $("#payment_summary_table").on("click", "#removeItem", function() {
            $(this).closest("tr").remove();
            calc_payment_summary_gtotal();
        });

        ////////// CLEAR ALL TABLE
        $(".clear_all_payment_summary").on("click", function() {
            clearall_payment_summary();
        });
        
        function clearall_payment_summary()
        {
            counter_summary = 0;
            calc_payment_summary_gtotal();
            $('#sub_total_payment_summary').html(parseFloat('0').toFixed(2));
            $("#payment_summary_table > tbody").empty();
            
            $(".add_new_payment_summary").trigger("click");//add new line
        }
        
        //GET payment_terms DROPDOWN LIST
        function payment_termsDDL_1(index = 0) {

                let payment_terms = '';
                $.ajax({
                    url: site_url + "hr_finance/C_payment_terms/payment_termsDDL",
                    type: 'GET',
                    dataType: 'json', // added data type
                    success: function(data) {
                        //console.log(data);
                        let i = 0;
                        payment_terms += '<option value="0">Payment Terms</option>';

                        $.each(data, function(index, value) {

                            payment_terms += '<option value="' + value.id + '">' + value.name+ '</option>';

                        });

                        $('#summarypaymenttermsid_' + index).html(payment_terms);

                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        console.log(xhr.status);
                        console.log(thrownError);
                    }
                });
        }
        ///
        //GET payment_terms DROPDOWN LIST
        function summary_status(index = 0) {

            let summary_status = '';
            //payment_terms += '<option value="0">Status</option>';
            summary_status += '<option>Paid</option>';
            summary_status += '<option>Unpaid</option>';
            summary_status += '<option>Partial Paid</option>';
            $('#summarystatus_' + index).html(summary_status);

        
        }
        ///
        ///////////////////
        /////////////ADD NEW LINES END HERE
        function calc_payment_summary_gtotal() {
            var total_chr = 0;
            var net_total = 0;

            $('.total_chr').each(function() {
                total_chr += parseFloat($(this).val());
            });

            sub_total_payment_summary = (total_chr ? total_chr : 0);

            //ASSIGN VALUE TO TEXTBOXES
            $('#sub_total_txt_payment_summary').val(parseFloat(sub_total_payment_summary).toFixed(2));
            /////////////
            
        }
            ///////////////////////////
            //payment_summary SECTION END HERE
            //////////////////////////
    });
</script>