class Question < ApplicationRecord
  belongs_to :survey
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :responses

  enum question_type: { radio: 'radio', checkbox: 'checkbox', text: 'text' }

  validates :content, presence: true
end
