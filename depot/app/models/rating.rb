class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  # belongs_to :rated_product, class_name: Product
  validates :user_id, :product_id, :score, presence: true
  validates :score, numericality: { only_integer: true, less_than_or_equal_to: 6 }
  validates :user_id, uniqueness: { scope: :product_id }

end
