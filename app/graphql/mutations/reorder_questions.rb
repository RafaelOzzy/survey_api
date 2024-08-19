# module Mutations
#   class ReorderQuestions < Mutations::BaseMutation
#     argument :survey_id, ID, required: true
#     argument :question_order, [ID], required: true

#     field :survey, Types::SurveyType, null: false

#     def resolve(survey_id:, question_order:)
#       survey = Survey.find(survey_id)
#       ActiveRecord::Base.transaction do
#         question_order.each_with_index do |id, index|
#           Question.find(id).update!(position: index + 1)
#         end
#       end

#       { survey: survey.reload }
#     rescue ActiveRecord::RecordInvalid => e
#       GraphQL::ExecutionError.new(e.record.errors.full_messages.join(", "))
#     end
#   end
# end
module Mutations
  class ReorderQuestions < Mutations::BaseMutation
    argument :survey_id, ID, required: true
    argument :question_order, [ID], required: true

    field :survey, Types::SurveyType, null: true
    field :errors, [String], null: false

    def resolve(survey_id:, question_order:)
      survey = Survey.find(survey_id)

      ActiveRecord::Base.transaction do
        question_order.each_with_index do |id, index|
          question = survey.questions.find(id)
          question.update!(position: index + 1)
        end
      end

      { survey: survey.reload, errors: [] }
    rescue ActiveRecord::RecordInvalid => e
      { survey: nil, errors: e.record.errors.full_messages }
    end
  end
end
