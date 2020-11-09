require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context "新規登録が上手くいくとき" do
      it "全ての情報が正常に保存される" do
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字以下だと登録できない" do
        @user.password = "a21"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角数字だけだと登録できない" do
        @user.password = "0000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが半角英字だけだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "last_nameがないと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角カナでないと登録できない" do
        @user.last_name = "ﾀｹｳﾁ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameがないと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_name全角カナでないと登録できない" do
        @user.first_name = "ｷｮｳｽｹ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "kana_lastがないと登録できない" do
        @user.kana_last = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last can't be blank")
      end
      it "kana_lastが全角カナではないと登録できない" do
        @user.kana_last = "ﾀｹｳﾁ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last is invalid")
      end
      it "kana_firstがないと登録できない" do
        @user.kana_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank")
      end
      it "kana_first全角カナではないと登録できない" do
        @user.kana_first = "ｷｮｳｽｹ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first is invalid")
      end
      it "誕生日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end