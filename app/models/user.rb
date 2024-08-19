class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = {
    coordinator: 'coordinator',
    respondent: 'respondent'
  }.freeze

  validates :role, inclusion: { in: ROLES.values }

  def coordinator?
    role == ROLES[:coordinator]
  end

  def respondent?
    role == ROLES[:respondent]
  end
end
