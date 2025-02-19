class Expense < ApplicationRecord
  belongs_to :employee

  monetize :amount_cents
  validates :category, :amount, presence: true
end
