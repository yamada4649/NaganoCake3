$(function () {
  $('.js-text_field').on('keyup', function () {
    var title = $.trim($(this).val());

    // 追加コード
    $.ajax({
      type: 'GET', // リクエストのタイプ
      url: '/', // リクエストを送信するURL
      data:  { name: name }, // サーバーに送信するデータ
      dataType: 'json' // サーバーから返却される型
    })
  });
});