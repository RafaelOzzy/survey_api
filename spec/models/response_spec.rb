require 'rails_helper'

RSpec.describe Response, type: :model do
  it { should belong_to(:question) }
  it { should validate_presence_of(:content) }
end
