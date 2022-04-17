app.controller('editpurchaseCtrl', function($scope,$http,$timeout) {
    
    //console.log(site_url);
    //$scope.sale_date = new Date();
    //$scope.coa = true;
    
    $scope.loader = true;//show loader gif
    //get all products
    $scope.getAllProduct= function(){
     
        $http.get(site_url+'/pos/Items/get_allItems',{cache: true}).then(function(response){
       
        $scope.loader = false;//hide loader gif
        $scope.products = response.data;
        //console.log(response);
        });
    }
    
     
    //get all products by supplier
    $scope.getAllProductBySupplier= function(supplier_id){
     
        $http.get(site_url+'/pos/Items/get_allItems/'+supplier_id,{cache: true}).then(function(response){
       
        $scope.loader = false;//hide loader gif
        $scope.products = response.data;
        //console.log(response.data);
        });
    }
    
    $scope.sup_currency_id = 0;
    $scope.currency_code = '';
    $scope.currency_name = '';
    $scope.currency_symbol = '';
        
     //get all products for sales
    $scope.getCurrency = function(currency_id){
       
       $scope.curr_loader = true;//show loader gif
       //INITIALIZE
        
        
        $http.get(site_url+'/setting/C_currencies/getCurrencyJSON/'+currency_id).then(function(response){
        
        if(response.data.length > 0)
        {
            $scope.sup_currency_id = parseInt(response.data[0].id);
            $scope.currency_code = response.data[0].code;
            $scope.currency_name = response.data[0].name;
            $scope.currency_symbol = response.data[0].symbol;
            // console.log(response);
        }
        
        $scope.curr_loader = false;//hide loader gif
        });
        
    }
        
     //clear All the cart
    $scope.editProductList = function(invoice_no, squadEdit)
    {   
        $scope.squadEdit = squadEdit;
        
        if(squadEdit == true)
           {
                $http.get(site_url+'/trans/C_receivings/getPurchaseItemsJSON/'+invoice_no).then(function(response){
                //console.log(response);
                
                $timeout(function(){
                    
                //find the player
                angular.forEach(response.data, function (returnData, index) {
                    
                    
                    $scope.invoice.items.push({
                        item_id: parseInt(returnData.item_id),
                        //quantity: parseFloat(1),
                        quantity:parseFloat(returnData.quantity_purchased),
                        name: returnData.name + (returnData.size == null ? '' : ' '+returnData.size),
                        unit_price: parseFloat(returnData.item_unit_price),
                        cost_price:parseFloat(returnData.item_cost_price),
                        discount_percent:parseFloat(returnData.discount_percent),
                        discount_value:parseFloat(returnData.discount_value),
                        exchange_rate:parseFloat(returnData.exchange_rate),
                        service:parseInt(returnData.service),
                        size_id:parseInt(returnData.size_id),
                        unit_id:(returnData.unit_id == null ? 0 : returnData.unit_id),
                        tax_id:parseFloat(returnData.tax_id),
                        tax_rate:parseFloat((returnData.tax_rate == null ? 0 : returnData.tax_rate)),
                        tax_name:returnData.tax_name,
                        //inventory_acc_code : returnData.inventory_acc_code,
                       
                    
                    });
                
                });
                
                });//$timeout
               //console.log($scope.invoice.items);
            });
                         
                         $http.get(site_url+'/trans/C_receivings/getPurchasesJSON/'+invoice_no).then(function(response1){
                         //console.log(response1);
                         
                            $timeout(function(){
                                
                                //find the player
                                angular.forEach(response1.data, function (returnData1, index) {
                                
                                
                                    $scope.supplier_id = parseInt(returnData1.supplier_id);
                                    $('#supp').val(null).trigger('change');//Clearing selections
                                    $('#supp').val(returnData1.supplier_id).trigger('change');
            
                                    // $('#emp').val(null).trigger('change');//Clearing selections
                                    // $('#emp').val(returnData.employee_id).trigger('change');
            
                                    $scope.register_mode = returnData1.register_mode;
                                    //$scope.description = returnData1.description;
                                    $scope.discount = parseFloat(returnData1.discount_value);
                                    $scope.receiving_date = new Date(returnData1.receiving_date);
                                    $scope.purchaseType = returnData1.account;
                                    $scope.supplier_invoice_no=returnData1.invoice_no;
                                    $scope.shipping=returnData1.shipping;
                                    $scope.payment_status=returnData1.payment_status;
                                    $scope.delivery_status=returnData1.delivery_status;
                                    $scope.total_amount=returnData1.total_amount;
                                    $scope.eta=returnData1.eta;
                                    $scope.etd=returnData1.etd;
                                    $scope.awb=returnData1.awb;
                                    $scope.shipping_cost=parseFloat(returnData1.shipping_cost);
                                    $scope.delivery_date=returnData1.delivery_date;
                                    $scope.payment_date=returnData1.payment_date;
                                    
                                    $scope.currency_id=(returnData1.currency_id);
                                    $scope.getCurrency(returnData1.currency_id);
                                    
                                    $scope.coa = (returnData1.coa == '1' ? true : false);
                                    $scope.msds = (returnData1.msds == '1' ? true : false);
                                    $scope.flowchart = (returnData1.flowchart == '1' ? true : false);
                                    $scope.forme = (returnData1.forme == '1' ? true : false);
                                    $scope.halal = (returnData1.v == '1' ? true : false);
                                    
                                   
                                });
                                
                              });//$timeout
                           });
           }
       else
           {
            $scope.invoice = {
                           items: []
                            };
           }
    }
    
    //call the clear cart function to clear all product
    $scope.editProductList();
    
    //clear All the cart
    // $scope.clearCart = function()
    // {   
    //     $scope.invoice = {
    //         supplier_id:'',
    //         supplier_invoice_no:'',
            
    //         items: []
    //         };
    // }
    
    // //call the clear cart function to clear all product
    // $scope.clearCart();
    
   //add product by barcode in purchase form
    $scope.addItemByBarcode = function (barcode){
            $timeout(function () {
                $scope.barcode; //from input
                //console.log($scope.barcode);
        
        //search product using barcode
        var returnData = $.grep($scope.products,function(element,index){
        return (element.barcode == barcode);
        })
       
        $scope.invoice.items.push({
                item_id: parseInt(returnData[0].item_id),
                quantity: parseFloat(1),
                //name: returnData[0].name + ' - '+ returnData[0].size,
                name: returnData[0].name + (returnData[0].size == null ? '' : ' '+returnData[0].size),
                unit_price: parseFloat(returnData[0].unit_price),
                cost_price:parseFloat(returnData[0].avg_cost),
                unit:'',
                size_id:(returnData[0].size_id == null ? 0 : returnData[0].size_id),
                unit_id:(returnData[0].unit_id == null ? 0 : returnData[0].unit_id),
                color_id:0,
                tax_id:parseFloat(returnData[0].tax_id),
                tax_rate:parseFloat((returnData[0].tax_rate == null ? 0 : returnData[0].tax_rate)),
                tax_name:returnData[0].tax_name,
                service:parseInt(returnData[0].service),
                avg_cost: parseFloat(returnData[0].avg_cost),
                //inventory_acc_code : returnData[0].inventory_acc_code,
            });
            
        $scope.barcode = '';
        },10);
    }
    //Add product to purchasing cart
    $scope.addItem = function(item_id,size_id) {
        
         
        //search product name using product id
        var returnData = $.grep($scope.products,function(element,index){
        return (element.item_id == item_id && element.size_id == size_id);
        })
       
        $scope.invoice.items.push({
                item_id: parseInt(returnData[0].item_id),
                quantity: parseFloat(1),
                //name: returnData[0].name,
                name: returnData[0].name + (returnData[0].size == null ? '' : ' '+returnData[0].size),
                unit_price: parseFloat(returnData[0].unit_price),
                avg_cost: parseFloat(returnData[0].avg_cost),
                size_id:(returnData[0].size_id == null ? 0 : returnData[0].size_id),
                unit_id:(returnData[0].unit_id == null ? 0 : returnData[0].unit_id),
                color_id:0,
                tax_id:parseFloat(returnData[0].tax_id),
                tax_rate:parseFloat((returnData[0].tax_rate == null ? 0 : returnData[0].tax_rate)),
                tax_name:returnData[0].tax_name,
                service:parseInt(returnData[0].service),
                cost_price:parseFloat(returnData[0].avg_cost),
                unit:'',
                //inventory_acc_code : returnData[0].inventory_acc_code,
                
            });
    }
    
    // Purchase products 
    $scope.updatePurchaseProducts = function(){
      
      var file = site_url+'/trans/C_receivings/editpurchaseProducts';
      
      var confirmSale = confirm('Are you absolutely sure you want to purchase?');
      
      //console.log($scope.supplier_id);
      
      if (confirmSale) {
          
       if($scope.invoice.items.length > 0)
        {
            if(parseInt($scope.supplier_id) == 0 || $scope.supplier_id == null)
            {
                alert('please select supplier');
            }else  if(parseInt($scope.supplier_invoice_no) == '' || $scope.supplier_invoice_no == null)
            {
                alert('please enter invoice no');
            }
            else
            {
                $scope.cart_loader = true;//show loader gif
                
                //collect all cart info and submit to db
                $scope.invoice = {
                    invoice_no:$scope.supplier_invoice_no,
                    receiving_id:$scope.receiving_id,
                    supplier_id:parseInt($scope.supplier_id),
                    emp_id:$scope.emp_id,
                    supplier_invoice_no:$scope.supplier_invoice_no,
                    purchaseType:$scope.purchaseType,
                    register_mode:$scope.register_mode,
                    amount_due:0,
                    total_tax:$scope.total_tax(),
                    description:$scope.description,
                    discount:$scope.discount,
                    receiving_date:$scope.receiving_date,
                    exchange_rate: ($scope.exchange_rate === undefined ? '' : $scope.exchange_rate),
                    //currency_id:($scope.supplier_currency_id === undefined ? '' : $scope.supplier_currency_id),
                    currency_id:$scope.currency_id,
                    shipping:$scope.shipping,
                    payment_status:$scope.payment_status,
                    delivery_status:$scope.delivery_status,
                    total_amount:$scope.total_amount,
                    coa:($scope.coa === undefined ? 0 : $scope.coa),
                    msds:($scope.msds === undefined ? 0 : $scope.msds),
                    flowchart:($scope.flowchart === undefined ? 0 : $scope.flowchart),
                    forme:($scope.forme === undefined ? 0 : $scope.forme),
                    halal:($scope.halal === undefined ? 0 : $scope.halal),
                    eta:($scope.eta == undefined ? '' : $scope.eta),
                    etd:($scope.etd == undefined ? '' : $scope.etd),
                    awb:($scope.awb == undefined ? '' : $scope.awb),
                    quotation:$scope.quotation,
                    shipping_cost:$scope.shipping_cost,
                    delivery_date:$scope.delivery_date,
                    ssdt:$scope.ssdt,
                    
                    items: $scope.invoice.items
                    };
         
                // fields in key-value pairs
                $http.post(file, $scope.invoice).then(function (response) {
                     
                    //alert('thenfully Purchased'+response.data);    
                    //console.log(response);
                    $scope.cart_loader = false;//hide loader gif
                    //$scope.clearCart();       
                    //$scope.getAllProduct();     
                    if(response.data.invoice_no == 'no-posting-type')
                   {
                     alert('Please assign posting type to supplier otherwise amount will not be posting to accounts');
                     window.location = site_url+"/trans/C_receivings";
                   }else
                   {
                        console.log(response.data);
                        //window.location = site_url+"/trans/C_receivings/receipt/"+response.data.invoice_no;
                        //window.location = site_url+"/trans/C_receivings/allPurchases";
                   }
                    //console.log(response.data.invoice_no);
                    
                });
            }
        }
        else
        {
            alert('Please select product');
        }
        
        }//confirm 
    }
    ///// end Purchase Products 
    
    //delete item from cart
    $scope.removeItem = function(index) {
        $scope.invoice.items.splice(index, 1);
    },
    
    //get discount of the cart products
    $scope.Tdiscount = function() {
        var discount = 0;
        angular.forEach($scope.invoice.items, function(item) {
            discount += (item.quantity * item.cost_price)*item.discount/100;
        })

        return discount.toFixed(2);
    }
    
    //get total of the cart products
    $scope.total = function() {
        var total = 0.00;
        angular.forEach($scope.invoice.items, function(item) {
            if(item.service){
                total += parseFloat(item.quantity * item.unit_price)+(item.quantity * item.unit_price)*item.tax_rate/100;
            }else{
                total += parseFloat(item.quantity * item.cost_price)+(item.quantity * item.cost_price)*item.tax_rate/100;
            }
            
        })
        //console.log(total);
        $scope.total_amount = total.toFixed(2);
        //return Math.ceil(total).toFixed(2);
        return total.toFixed(2);
    }
    
     //CALCULATE TOTAL TAX
     $scope.total_tax = function() {
        var tax = 0;
        angular.forEach($scope.invoice.items, function(item) {
            if(!isNaN(item.tax_rate))
            {
                if(item.service){
                    tax += (item.quantity * item.unit_price)*item.tax_rate/100;    
                }else{
                    tax += (item.quantity * item.cost_price)*item.tax_rate/100;    
                }
            }
            
        })
        return tax.toFixed(4);
    }
    
});