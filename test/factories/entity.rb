FactoryGirl.define do
  sequence :entity_text do |n|
    "http://host/ontology/#{n}"
  end
  
  sequence :entity_kind do |n|
    "Kind#{n}"
  end
  
  factory :entity do
    association :ontology
    text { FactoryGirl.generate :entity_text }
    kind { FactoryGirl.generate :entity_kind }
    name { Faker::Name.name }

    factory :entity_with_fragment do
      text "Class <http://example.com/resource#Fragment>"
    end
    
    factory :entity_without_fragment do
      text "Class <http://example.com/resource>"
    end
  end
end
