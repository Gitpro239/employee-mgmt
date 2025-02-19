class Payroll < ApplicationRecord
  belongs_to :employee

  monetize :gross_salary_cents
  monetize :tax_deductions_cents
  monetize :net_salary_cents

  validates :pay_date, presence: true
end
