$(function(){
  
$('.button_to').on('click', function(e){
  $(this).closest('.sc-list-item-content').addClass('delete'); 
  console.log(this)
  var total_count = 0
  
    var price = $('#price','.delete').text();
    var count = $('#count','.delete').text();
    total_count += gon.total_count - count.replace(/[^0-9]/g, "");
    var total_price = gon.total_price - price
    console.log(total_count);


      $('#total_price').text("¥ " + total_price);
      $('#sc-subtotal-amount-activecart').text("¥ " + total_price);
      $('#total_count').text("小計　(" + total_count + "点)");
      $('#sc-subtotal-label-activecart').text("小計　(" + total_count + "点)");
    
  $('.delete').fadeOut();
    });
  });
