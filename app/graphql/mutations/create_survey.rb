module Mutations
  class CreateSurvey < BaseMutation
    argument :title, String, required: true
    argument :questions_attributes, [Types::QuestionInputType], required: true

    field :survey, Types::SurveyType, null: false

    def resolve(title:, questions_attributes:)
      # Convert the input types to hashes
      question_attrs = questions_attributes.map(&:to_h)

      # Create the survey with the converted attributes
      survey = Survey.create!(
        title: title,
        questions_attributes: question_attrs
      )
      { survey: survey }
    end
  end
end
