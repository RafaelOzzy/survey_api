class User < ApplicationRecord
  # Inclui os módulos do Devise que você precisa
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Define os papéis de usuário
  ROLES = {
    coordinator: 'coordinator',
    respondent: 'respondent'
  }.freeze

  # Validações
  validates :role, inclusion: { in: ROLES.values }

  # Métodos para verificar os papéis
  def coordinator?
    role == ROLES[:coordinator]
  end

  def respondent?
    role == ROLES[:respondent]
  end
end
