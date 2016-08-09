FactoryGirl.define do
  factory :location do
    code { Random.rand(0 .. 9999999999) }
    name { Faker::name }
  end
end
