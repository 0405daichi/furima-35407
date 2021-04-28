class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_ruby, presence: true
  validates :first_ruby, presence: true
  validates :birthday, presence: true
  validates :encrypted_password, presence: true

  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角文字を使用してください' } do
    validates :family_name
    validates :first_name
    validates :family_ruby
    validates :first_ruby
  end

  has_many :items
  has_many :comments
  has_many :sold_items
end
