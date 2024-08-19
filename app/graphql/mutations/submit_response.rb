module Mutations
  class SubmitResponse < Mutations::BaseMutation
    argument :question_id, ID, required: true
    argument :content, String, required: true

    field :response, Types::ResponseType, null: false

    def resolve(question_id:, content:)
      question = Question.find(question_id)
      response = question.responses.create!(content: content)
      { response: response }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.record.errors.full_messages.join(", "))
    end
  end
end
