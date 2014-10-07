$(document).ready(function() {
  $('.rating_class').change(function() {
    var _this = this
    $.ajax({
      type: "POST",
      url: "/ratings",
      data: { product_id: $(this).attr('data-product-id'), score: $(this).val() },
      dataType: 'json',
      success: function(data) {
        if(data['success']) {
          alert('Rating has been saved')
          console.log(data)
          console.log($(_this))
          $(_this).next().text('Avg-Rating: ' + data['average_rating'])
        }
        else { alert('Unable to save rating') }
      }
    })
  })
})
