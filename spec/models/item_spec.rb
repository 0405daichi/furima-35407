require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it 'item_name,item_description,category_id,status_id,item_price,burden_id,source_id,guideline_idがあれば出品できる' do
        expect(@item).to be_valid
      end

      it 'item_priceが300以上なら出品できる' do
        @item.item_price = 300
        expect(@item).to be_valid
      end

      it 'item_priceが9,999,999以下なら出品できる' do
        @item.item_price = 9_999_999
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'item_descriptionが空では出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end

      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end

      it 'status_idが1では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status must be other than 1'
      end

      it 'item_priceが空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end

      it 'item_priceが300未満なら出品できない' do
        @item.item_price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price must be greater than or equal to 300'
      end

      it 'item_priceが10,000,000以上なら出品できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price must be less than 10000000'
      end

      it 'item_priceが半角数字でなければ出品できない' do
        @item.item_price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item price is not a number'
      end

      it 'item_priceが半角英数混合では出品できない' do
        @item.item_price = '123aiu'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not a number"
      end

      it 'item_priceが半角英語だけでは出品できない' do
        @item.item_price = 'aiueo'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not a number"
      end

      it 'burden_idが1では出品できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Burden must be other than 1'
      end

      it 'source_idが1では出品できない' do
        @item.source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Source must be other than 1'
      end

      it 'guideline_idが1では出品できない' do
        @item.guideline_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Guideline must be other than 1'
      end

      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
