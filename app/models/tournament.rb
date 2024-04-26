class Tournament < ApplicationRecord
  validates :name, presence: true
  validates :sport, presence: true
  validates :tournament_type, presence: true
  validates :teams_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  enum status: { active: 'active', inactive: 'inactive', completed: 'completed' }
end
