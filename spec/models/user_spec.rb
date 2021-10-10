RSpec.describe User, type: :model do
  it "アカウント名が取得できること"
  user = User.new(
          name: "タロ"
  )
  expect(user.name).to eq "タロ"
end