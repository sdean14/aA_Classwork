FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password { 'password123' }
    # session_token
      # factory :paul do
      #   username { "Paul321" }
      #   password { 'mynameispaul' }
      # end
  end
  
end
