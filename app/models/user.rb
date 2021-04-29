class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do      
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_ruby
    validates :first_ruby
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  validates :name, presence: true, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"} do
    validates :family_ruby
    validates :first_ruby
  end

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # has_many :items
  # has_many :comments
  # has_many :sold_items
end
