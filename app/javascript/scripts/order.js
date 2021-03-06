$(document).ready(function () {
  var idx = 2;

  // テーブル行追加
  $('#addRow').on("click", function () {
    var html = "<tr><td>" + (++idx) + "</td>"
    + "<td>"
    +  "<select style='width:80%' name='都道府県'>"
    +    "<option value='selected'>商品を選択してください</option>"
    +    "<option value=''>SKU0001</option>"
    +    "<option value=''>SKU0002</option>"
    +    "<option value=''>SKU0003</option>"
    +    "<option value=''>SKU0004</option>"
    +  "</select></td>"
    + "<td><input type='number' class='inputNum itemQty' value='0' /></td>"
    + "<td><input type='number' class='inputNum itemPrice' value='0' /></td>"
    + "<td><span class='totalPrice'></span></td>"
      + "<td><button class='removeRow ml-4'>-</button></td></tr>";

    $('tbody').append(html);
  });

  // テーブル行削除
  $(document).on('click', '.removeRow', function() {
    $(this).parents('tr').remove();
  });

  $(document).on('change', '.inputNum', function () {
    var item_Qty = $(this).parents('tr').find(".itemQty").val();
    var item_Price = $(this).parents('tr').find(".itemPrice").val();
    var totalPrice = item_Qty * item_Price;

    $(this).parents("tr").find('span').text(totalPrice);
  });

});
