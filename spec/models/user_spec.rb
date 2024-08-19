require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_inclusion_of(:role).in_array(['coordinator', 'respondent']) }

  describe '#coordinator?' do
    it 'returns true if the user is a coordinator' do
      user = User.new(role: 'coordinator')
      expect(user.coordinator?).to be true
    end

    it 'returns false if the user is not a coordinator' do
      user = User.new(role: 'respondent')
      expect(user.coordinator?).to be false
    end
  end

  describe '#respondent?' do
    it 'returns true if the user is a respondent' do
      user = User.new(role: 'respondent')
      expect(user.respondent?).to be true
    end

    it 'returns false if the user is not a respondent' do
      user = User.new(role: 'coordinator')
      expect(user.respondent?).to be false
    end
  end
end
