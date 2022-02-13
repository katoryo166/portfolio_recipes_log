FactoryBot.define do
  factory :post_recipe do
   user_id {"1"}
    title { "test" }
    cook_time {5}
    ingredient{"text"}
    post_introduction { "tester" }
    association :user #@postモデルは@userが投稿するので、関連付けを定義する。
  end
end
