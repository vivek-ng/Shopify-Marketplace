class Order < ApplicationRecord
  belongs_to :Product
  belongs_to :Cart
end
