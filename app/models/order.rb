class Order < ApplicationRecord
  attr_accessor :token
  has_one :item
  has_one :address
  belongs_to :user
end
