FactoryBot.define do
  factory :goal do
    user_id { 1 }
    public_goal { "MyString" }
    private_goal { "MyString" }
  end
end
