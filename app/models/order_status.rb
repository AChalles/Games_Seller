class OrderStatus < ApplicationRecord
  has_many :orders

  def to_s
    status
  end
end
