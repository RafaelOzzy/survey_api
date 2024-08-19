require 'rails_helper'

RSpec.describe 'Surveys Query', type: :request do
  it 'returns all surveys with their questions' do
    survey1 = create(:survey, title: "Survey 1")
    survey2 = create(:survey, title: "Survey 2")
    question1 = create(:question, survey: survey1, content: "Question 1")
    question2 = create(:question, survey: survey2, content: "Question 2")

    query = <<~GQL
      {
        surveys {
          id
          title
          questions {
            id
            content
          }
        }
      }
    GQL

    post '/graphql', params: { query: query }

    json = JSON.parse(response.body)
    data = json['data']['surveys']

    expect(data).to match_array([
      { 'id' => survey1.id.to_s, 'title' => survey1.title, 'questions' => [{ 'id' => question1.id.to_s, 'content' => question1.content }] },
      { 'id' => survey2.id.to_s, 'title' => survey2.title, 'questions' => [{ 'id' => question2.id.to_s, 'content' => question2.content }] }
    ])
  end
end
