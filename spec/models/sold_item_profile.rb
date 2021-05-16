require 'rails_helper'

RSpec.describe SoldItemProfile, type: :model do
  before do
    @sold_item_profile = FactoryBot.build(:sold_item_profile)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_code,prefecture_id,municipality,address,phone_number,tokenがあれば購入できる' do
        expect(@sold_item_profile).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeがないと購入できない' do
        @sold_item_profile.postal_code = nil
        @sold_item_profile.valid?
        expect(@sold_item_profile.errors.full_messages).to include "Postal code can't be blank", "Postal code Include hyphen(-)"
      end

      it 'prefecture_idがないと購入できない' do
        @sold_item_profile.prefecture_id = nil
        @sold_item_profile.valid?
        expect(@sold_item_profile.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
      end

      it 'municipalityがないと購入できない' do
        @sold_item_profile.municipality = nil
        @sold_item_profile.valid?
        expect(@sold_item_profile.errors.full_messages).to include "Municipality can't be blank"
      end

      it 'addressがないと購入できない' do
        @sold_item_profile.address = nil
        @sold_item_profile.valid?
        expect(@sold_item_profile.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_numberがないと購入できない' do
        @sold_item_profile.phone_number = nil
        @sold_item_profile.valid?
        expect(@sold_item_profile.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'tokenがないと購入できない' do
        @sold_item_profile.token = nil
        @sold_item_profile.valid?
        expect(@sold_item_profile.errors.full_messages).to include "Token can't be blank"
      end

      it 'postal_codeにhyphenがないと購入できない' do
        @sold_item_profile.postal_code = 1234567
        @sold_item_profile.valid?
        expect(@sold_item_profile.errors.full_messages).to include "Postal code Include hyphen(-)"
      end

      it 'prefecture_idが1では購入できない' do
        @sold_item_profile.prefecture_id = 0
        @sold_item_profile.valid?
        expect(@sold_item_profile.errors.full_messages).to include "Prefecture must be other than 0"
      end

      it 'phone_numberが12以上では購入できない' do
        @sold_item_profile.phone_number = 123456789012
        @sold_item_profile.valid?
        expect(@sold_item_profile.errors.full_messages).to include "Phone number is invalid"
      end

      
    end
  end
end
