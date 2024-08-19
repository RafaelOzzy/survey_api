module Types
  class MutationType < Types::BaseObject
    field :create_survey, mutation: Mutations::CreateSurvey
    field :reorder_questions, mutation: Mutations::ReorderQuestions
    field :submit_response, mutation: Mutations::SubmitResponse
  end
end
