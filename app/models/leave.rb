class Leave < ApplicationRecord
  belongs_to :employee

  enum status: { pending: 0, approved: 1, rejected: 2}
  validates :start_date, :end_date, presence: true
end
