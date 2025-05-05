class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :toystore
  def total_price
		toystore.price * quantity
	end
end
# app/models/line_item.rb


  def total_price
    toystore.price * quantity
  end

