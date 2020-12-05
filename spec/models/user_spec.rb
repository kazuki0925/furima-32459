require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it '入力画面全ての項目が存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上であれば登録できる' do
          @user.password = '123abc'
          @user.password_confirmation = '123abc'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailに＠が含まれていない場合は登録できない' do
          @user.email = 'test.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空では登録できない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '123ab'
          @user.password_confirmation = '123ab'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordには英字と数字の両方を含めていないと登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordとpassword_confirmationが一致していないと登録できない' do
          @user.password = '123abc'
          @user.password_confirmation = 'abc123'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'last_nameが全角（漢字・ひらがな・カタカナ）以外の入力では登録できない' do
          @user.last_name = 'namae'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'first_nameが全角（漢字・ひらがな・カタカナ）以外の入力では登録できない' do
          @user.first_name = 'namae'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
        end
        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'last_name_kanaがカタカナ以外の入力では登録できない' do
          @user.last_name_kana = 'なまえ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters.')
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'first_name_kanaがカタカナ以外の入力では登録できない' do
          @user.first_name_kana = 'なまえ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
        end
        it 'birth_dateに１カ所でも空欄があれば登録できない' do
          @user.birth_date = '2000-12'
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end
