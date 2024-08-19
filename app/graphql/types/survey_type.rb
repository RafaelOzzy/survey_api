# frozen_string_literal: true

module Types
  class SurveyType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :questions, [Types::QuestionType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def questions
      object.questions
    end
  end
end
