class Toystore < ApplicationRecord
    has_one_attached :main_image
    has_many :line_items

end
