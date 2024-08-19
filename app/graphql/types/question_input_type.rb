module Types
  class QuestionInputType < Types::BaseInputObject
    argument :question_type, String, required: true
    argument :content, String, required: true
    argument :responses_attributes, [Types::ResponseInputType], required: false
  end
end
