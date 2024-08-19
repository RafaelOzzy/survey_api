require 'rails_helper'

RSpec.describe 'SubmitResponse', type: :request do
  it 'allows a respondent to submit a response to a survey question' do
    survey = create(:survey)
    question = create(:question, survey: survey)

    mutation = <<~GQL
      mutation {
        submitResponse(input: {
          questionId: "#{question.id}",
          content: "My Answer"
        }) {
          response {
            id
            content
          }
        }
      }
    GQL

    post '/graphql', params: { query: mutation }

    json = JSON.parse(response.body)

    # Adicione debug para inspecionar a resposta
    puts JSON.pretty_generate(json)

    data = json['data']['submitResponse']['response']
    expect(data['content']).to eq('My Answer')
  end
end
