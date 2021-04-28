require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemailとpasswordとencrypted_passwordとfamily_nameとfirst_nameとfamily_rubyとfirst_rubyとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordとencrypted_passwordが6文字以上であれば登録できる' do
        @user.password = 'test12'
        @user.encrypted_password = 'test12'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test1'
        @user.encrypted_password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordが存在してもencrypted_passwordが空では登録できない' do
        @user.encrypted_password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Encrypted password can't be blank"
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'family_rubyが空では登録できない' do
        @user.family_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family ruby can't be blank"
      end

      it 'first_rubyが空では登録できない' do
        @user.first_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First ruby can't be blank"
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'family_nameが全角でなければ登録できない' do
        @user.family_name = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name に全角文字を使用してください'
      end

      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name に全角文字を使用してください'
      end

      it 'family_rubyが全角でなければ登録できない' do
        @user.family_ruby = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family ruby に全角文字を使用してください'
      end

      it 'first_rubyが全角でなければ登録できない' do
        @user.first_ruby = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First ruby に全角文字を使用してください'
      end
    end
  end
end
