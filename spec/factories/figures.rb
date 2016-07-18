FactoryGirl.define do
  sequence(:name) {|n| "Figure ##{n}"}
  sequence(:release_date) {|n| "2016-05-#{n}"}
  sequence(:character_id) {|n| n}

  factory :figure  do
      name
      release_date
      character_id
  end

end
