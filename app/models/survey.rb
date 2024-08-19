class Survey < ApplicationRecord
  has_many :questions, -> { order(:position) }, dependent: :destroy
  accepts_nested_attributes_for :questions
  validates :title, presence: true
end
