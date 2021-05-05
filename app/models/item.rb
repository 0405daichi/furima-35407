class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :category_id
    validates :status_id
    validates :item_price
    validates :burden_id
    validates :source_id
    validates :guideline_id
    validates :image
  end

  validates :item_price,
            numericality: {
              greater_than_or_equal_to: 300,
              less_than: 10_000_000
            }

  validates :item_price, format: { with: /\A^[0-9]+$\z/, message: 'は半角数字のみで入力してください' }

  with_options numericality: { other_than: 1 } do
    validates :category_id

    validates :status_id

    validates :burden_id

    validates :source_id

    validates :guideline_id

  end

  belongs_to :user
  has_many :comments
  has_one :solid_item
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :source
  belongs_to :guideline
end
