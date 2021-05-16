class SoldItem < ApplicationRecord
  attr_accessor :token
  belongs_to :item
  belongs_to :user
  has_one :profile
  has_one_attached :image
end
