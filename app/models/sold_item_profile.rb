class SoldItemProfile
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end
  
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Include hyphen(-)"}
  
    validates :prefecture_id, numericality: {other_than: 1}
  
    validates :phone_number, format: {with: /\A\d{10,11}\z/
  }
    def save
      sold_item = SoldItem.create(user_id: user_id, item_id: item_id)
  
      Profile.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, sold_item: sold_item)
    end
end

