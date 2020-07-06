require 'rails_helper'
describe User do
  describe '#create' do
    it "nameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "passwordとpassword_confirmationが一致しない場合は登録できないこと" do
      user = build(:user, password_confirmation: "22222222")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "重複したemailが存在する場合は登録できないこと" do
      user1 = create(:user, name: "user1", email: "iga@test.com")
      user2 = build(:user, name: "user2", email: "iga@test.com")
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end
  end
end