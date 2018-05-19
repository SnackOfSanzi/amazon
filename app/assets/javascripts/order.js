$(function(){
  $('.button_to').on('click', function(e){
    $(this).closest('.sc-list-item-content').addClass('delete'); 
    
      var deletePrice = $('#prices','.delete').text();
      var deleteCount = $('#count','.delete').text();
      var totalCount = $('#total_count').text().replace(/[^0-9]/g, "");
      var totalPrice = $('#total_price').text().replace(/[^0-9]/g, "");
      var deleteTotalCount = totalCount - deleteCount.replace(/[^0-9]/g, "");
      var deleteTotalPrice = totalPrice - deletePrice;
      

        $('#total_price').text("¥ " + deleteTotalPrice);
        $('#sc-subtotal-amount-activecart').text("¥ " + deleteTotalPrice);
        $('#total_count').text("小計　(" + deleteTotalCount + "点)");
        $('#sc-subtotal-label-activecart').text("小計　(" + deleteTotalCount + "点)");

    $('.delete').fadeOut('fast').queue(function() {
  $('.delete').remove();
    });
  });
});


$(function(){
    $('.edit_product').submit('click', function(e){
      $(this).closest('.sc-list-item-content').addClass('change');

      var changeCount = $('#product_order_products_quantity','.change' ).val();
      console.log(changeCount)
      var test3 = $('#price', '.change').text().replace(/[^0-9]/g, "");
      var test9 = $('#prices', '.change').text().replace(/[^0-9]/g, "");
      var test4 =  $('#count','.change').text();
      var changePrice = test3 * changeCount;
        $('#prices', '.change').text(changePrice);
        $('#count','.change').text(changeCount);

        if (test3 <= changePrice){

          var changeTotaleCount =  changeCount - test4 
          var changeTotalePrice =  changePrice - test9
          var totalCount = $('#total_count').text().replace(/[^0-9]/g, "");
          var totalPrice = $('#total_price').text().replace(/[^0-9]/g, ""); 
          var completeTotaleCount = Number(totalCount) + changeTotaleCount
          var completeTotalePrice = Number(totalPrice) + changeTotalePrice

          $('#total_price').text("¥ " + completeTotalePrice);
          $('#sc-subtotal-amount-activecart').text("¥ " + completeTotalePrice);
          $('#total_count').text("小計　(" + completeTotaleCount + "点)");
          $('#sc-subtotal-label-activecart').text("小計　(" + completeTotaleCount + "点)");
          $('.sc-list-item-content').removeClass('change');

        }else{

          var changeTotaleCount =  test4 - changeCount
          var changeTotalePrice =  test9 - changePrice
          var totalCount = $('#total_count').text().replace(/[^0-9]/g, "");
          var totalPrice = $('#total_price').text().replace(/[^0-9]/g, ""); 
          var completeTotaleCount = Number(totalCount) - changeTotaleCount
          var completeTotalePrice = totalPrice - changeTotalePrice

          $('#total_price').text("¥ " + completeTotalePrice);
          $('#sc-subtotal-amount-activecart').text("¥ " + completeTotalePrice);
          $('#total_count').text("小計　(" + completeTotaleCount + "点)");
          $('#sc-subtotal-label-activecart').text("小計　(" + completeTotaleCount + "点)");
          $('.sc-list-item-content').removeClass('change');

        }
    });
  });
