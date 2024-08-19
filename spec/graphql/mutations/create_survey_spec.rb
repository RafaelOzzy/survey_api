require 'rails_helper'

RSpec.describe 'CreateSurvey', type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        createSurvey(input: {
          title: "Favorite Colors",
          questionsAttributes: [
            { questionType: "radio", content: "What's your favorite color?", responsesAttributes: [{ content: "Red" }, { content: "Blue" }, { content: "Green" }] },
            { questionType: "checkbox", content: "Select all fruits you like:", responsesAttributes: [{ content: "Apple" }, { content: "Banana" }, { content: "Cherry" }] },
            { questionType: "text", content: "Any additional comments?" }
          ]
        }) {
          survey {
            id
            title
            questions {
              id
              content
              questionType
              responses {
                id
                content
              }
            }
          }
        }
      }
    GQL
  end

  it 'creates a survey with multiple questions of different types' do
    post '/graphql', params: { query: mutation }

    json = JSON.parse(response.body)
    data = json['data']['createSurvey']['survey']

    expect(data['title']).to eq('Favorite Colors')
    expect(data['questions'].size).to eq(3)
    expect(data['questions'][0]['questionType']).to eq('radio')
    expect(data['questions'][1]['questionType']).to eq('checkbox')
    expect(data['questions'][2]['questionType']).to eq('text')
  end
end
