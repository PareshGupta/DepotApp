class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  
  validates :title, uniqueness: true, length: {
    in: 6..20,
    too_long: "%{count} characters is the maximum allowed",
    too_short: "%{count} character is the minimum allowed"
  }

  validates :image_url, allow_blank: true, format: {
    with: /\.[gif|jpg|png|jpeg]/i,
    message: 'must be a URL for GIF, JPG, PNG or JPEG image.'
  }
  
  # callbacks
  # before_create do
  #   self.title = title.capitalize
  # end

  # # callbacks
  # before_update do
  #   self.title = title.capitalize
  # end

  # # callbacks
  # after_touch do
  #   puts 'you touch the product'
  # end

  def self.latest
    Product.order(:updated_at).last
  end

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
