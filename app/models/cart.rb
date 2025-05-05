# app/models/cart.rb
class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  def add_product(toystore_id)
    product = Toystore.find(toystore_id)
  
    # define current_item before using it
    current_item = line_items.find_by(toystore_id: toystore_id)
  
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(toystore_id: toystore_id)
    end
  
    current_item
  end
end
# app/models/cart.rb


  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
  
    def total_price
      line_items.to_a.sum { |item| item.total_price }
    end
  end
  