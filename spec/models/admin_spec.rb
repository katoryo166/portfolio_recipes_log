require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe '#Admin' do
    context '管理者の名前、メールアドレス、パスワードがあるとき' do
      it "有効である" do
        user = User.new(
        name: "admin",
         email: "testman@example.com",
         password: "password",
         )
         # オブジェクトをexpectに渡した時に、有効である(be valid)という意味になります
         expect(user).to be_valid
      end
    end
    context '名前がないとき' do
      it "無効である" do
        user = User.new(
         name: nil,
         email: "testman@example.com",
         password: "password"
         )
         user.valid?
         expect(user.errors[:name]).to include("が入力されていません。")
      end
    end
    context 'メールアドレスがないとき' do
      it "無効である" do
        user = User.new(
         name: "admin",
         email: nil,
         password: "password"
         )
         user.valid?
         expect(user.errors[:email]).to include("が入力されていません。")
      end
    end
    context 'パスワードがないとき' do
      it "無効である" do
        user = User.new(
         name: "admin",
         email: "testman@example.com",
         password: nil
         )
         user.valid?
         expect(user.errors[:password]).to include("が入力されていません。")
      end
    end
  end
end
