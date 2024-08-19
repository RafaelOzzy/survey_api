# frozen_string_literal: true

module Types
  class QuestionType < Types::BaseObject
    field :id, ID, null: false
    field :survey_id, Integer, null: false
    field :question_type, String, null: false
    field :content, String, null: false
    field :responses, [Types::ResponseType], null: false
    field :position, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
