require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:survey) }
  it { should have_many(:responses).dependent(:destroy) }
  it { should validate_presence_of(:content) }
end
