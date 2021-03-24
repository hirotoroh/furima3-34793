require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー管理機能' do
    context '新規登録できるとき' do
      it '全てが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは@を含むこと' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'emailは一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは６文字以上でないと登録できないこと' do
        @user.password = 'aaa11'
        @user.password_confirmation = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは全角では登録できないこと' do
        @user.password = 'aaa１１１'
        @user.password_confirmation = 'aaa１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'family_nameが空では登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.family_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaは全角カタカナ以外では登録できないこと' do
        @user.family_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaは全角カタカナ以外では登録できないこと' do
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'birth_dayが空では登録できないこと' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
