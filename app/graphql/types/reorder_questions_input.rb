module Types
  class ReorderQuestionsInput < Types::BaseInputObject
    argument :survey_id, ID, required: true
    argument :question_order, [ID], required: true
  end
end
