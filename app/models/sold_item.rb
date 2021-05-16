class SoldItem < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :profile
 
end
