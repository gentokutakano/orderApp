$(document).ready(function () {
  var idx = 1;
  var remove_button = "<button class='removeRow ml-4'>-</button>";

  // テーブル行追加
  $(document).on('click', '#addRow', function () {
    // カラムをコピー
    var clone_area = content_area_1.cloneNode(true);

    // 各idを挿入
    clone_area.id = "content_area_" + (++idx);
    clone_element_id = clone_area.querySelector("#column_id_1");
    clone_element_id.id = "column_id_" + (idx);
    clone_element_id.textContent = idx;
    clone_element_id = clone_area.querySelector("#remove_id_1");
    clone_element_id.id = "remove_id_" + (idx);

    // コピーカラムを追加
    $('tbody')[0].append(clone_area);
    $("#remove_id_" + (idx)).append(remove_button);

    // カラムの値を初期化
    var thisColumnArea = $("#content_area_" + (idx));
    thisColumnArea.find(".itemQty").val("0");
    thisColumnArea.find(".itemPrice").val("0");
    thisColumnArea.find(".totalPrice").val("");
  });

  // テーブル行削除
  $(document).on('click', '.removeRow', function() {
    $(this).parents('tr').remove();

    ///購入金額再計算
    AutoPurchaseCalc.trigger('change');
  });

  //カラムtotalPrice自動計算
  $(document).on('change', '.inputNum', function () {
    var item_Qty = $(this).parents('tr').find(".itemQty").val();
    var item_Price = $(this).parents('tr').find(".itemPrice").val();
    var totalPrice = item_Qty * item_Price;

    $(this).parents("tr").find('.totalPrice').val(totalPrice);
  });

  //購入金額計算フォーマット
  var AutoPurchaseCalc = $(document).on('change', $('.totalPrice').value, function () {
    var inputs = $('.totalPrice').each(function(index, element){
      return element.value;  // valueを取り出す
    }).get();  // 標準的な配列に変換

    var sum = 0;
    for (var i = 0; i < inputs.length; i++){
      if (parseInt(inputs[i].value, 10)) {
        sum += parseInt(inputs[i].value, 10);
        $("#total").text(sum + '円');

        var totalAmount = Math.round(sum * 110 / 100);
        $("#totalAmount").text(totalAmount + "円");

        var tax = totalAmount - sum;
        $("#tax").text(tax);
      }
    }
  });

  //itemQtyとitemPrice自動設定
  $(document).on("change", ".SkuBox", function () {
    var maxQty = $("option:selected", this).data("max-qty");
    var itemPrice = $("option:selected", this).data("item-price");
    $(this).parents('tr').find(".itemQty").attr("max", maxQty);
    // $(this).parents('tr').find(".itemPrice").attr("value", itemPrice);
    $(this).parents('tr').find(".itemPrice").val(itemPrice);
  });

});
