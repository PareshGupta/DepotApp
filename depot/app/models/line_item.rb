class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, touch: true

  def total_price
    product.price * quantity
  end
  
  # callback
  after_touch do
    puts 'you touched Product/LineItem'
  end

end
