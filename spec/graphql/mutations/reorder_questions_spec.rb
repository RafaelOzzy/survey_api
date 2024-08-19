require 'rails_helper'

RSpec.describe 'ReorderQuestions Mutation', type: :request do
  it 'reorders questions within a survey' do
    survey = create(:survey)
    question1 = create(:question, survey: survey, content: "Question 1")
    question2 = create(:question, survey: survey, content: "Question 2")

    mutation = <<~GQL
      mutation {
        reorderQuestions(input: {
          surveyId: "#{survey.id}",
          questionOrder: ["#{question2.id}", "#{question1.id}"]
        }) {
          survey {
            id
            questions {
              id
              content
            }
          }
        }
      }
    GQL

    post '/graphql', params: { query: mutation }

    json = JSON.parse(response.body)

    # Adicione debug para inspecionar a resposta
    puts JSON.pretty_generate(json)

    questions = json['data']['reorderQuestions']['survey']['questions']
    expect(questions.map { |q| q['id'] }).to eq([question2.id.to_s, question1.id.to_s])
  end
end
