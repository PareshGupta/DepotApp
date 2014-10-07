class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  after_destroy :after_destroy_method
  
  # callbacks
  def after_destroy_method
    puts 'line_items too is destroyed along with cart'
  end

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
  
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
