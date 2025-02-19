class Reimbursement < ApplicationRecord
  belongs_to :employee

  monetize :amount_cents
  validates :status, inclusion: { in: %w[pending approved rejected]}
end
