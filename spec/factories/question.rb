FactoryBot.define do
  factory :question do
    survey
    question_type { "radio" }
    content { "My Question" }
  end
end
