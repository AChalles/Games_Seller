class Game < ApplicationRecord
  belongs_to :genres
  belongs_to :companies
  belongs_to :platforms
  belongs_to :orders
  belongs_to :past_orders
end
