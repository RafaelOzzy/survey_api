module Types
  class ReorderQuestionsPayload < Types::BaseObject
    field :survey, Types::SurveyType, null: true
    field :errors, [String], null: false
  end
end
