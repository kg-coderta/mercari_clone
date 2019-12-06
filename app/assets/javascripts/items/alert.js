$(function(){
  $(document).on('click', '.a-container__main__submit__next', function(){
    if($('#item_name').val() === ""){
      alert('「商品名」を入力してください');
      $('#item_name').focus();
      return false;
    }
    if($('#item_description').val() === ""){
      alert('「商品の説明」を入力してください');
      return false;
    }
    if($('#grandchild_category').val() == undefined || $('#grandchild_category').val() == "---"){
      alert('カテゴリーを選択してください');
      return false;
    }
    if($('#item_state').val() === ""){
      alert('「商品の状態」を選択してください');
      return false;
    }
    if($('#item_carriage').val() === ""){
      alert('「配送料の負担」を選択してください');
      return false;
    }
    if($('#item_method').val() === ""){
      alert('「配送の方法」を選択してください');
      return false;
    }
    if($('#item_region').val() === ""){
      alert('「発送元の地域」を選択してください');
      return false;
    }
    if($('#item_date').val() === ""){
      alert('「発送までの日数」を選択してください');
      return false;
    }
    if($('#item_price').val() === ""){
      alert('価格を入力してください');
      return false;
    }
  })
})