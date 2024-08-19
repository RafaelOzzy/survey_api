require 'rails_helper'

RSpec.describe SurveyPolicy, type: :policy do
  let(:coordinator) { User.create!(role: 'coordinator', email: 'coordinator@example.com', password: 'password') }
  let(:respondent) { User.create!(role: 'respondent', email: 'respondent@example.com', password: 'password') }
  let(:survey) { Survey.create!(title: 'Sample Survey') }

  subject { described_class }

 
end
