FactoryGirl.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    middle_name { Faker::name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.between(100.years.ago, Date.today) }
    gender { Patient.genders.keys.sample }
    status { Patient.statuses.keys.sample }
  end
end
