class Salary < ApplicationRecord
  belongs_to :employee

  monetize :basic_pay_cents
  monetize :allowances_cents
  monetize :deductions_cents

  validates :basic_pay, presence: true, numericality: { greater_than: 0 }
  def deduction
    #  basic_pay + allowances - deductions

    #  employee_id = self.id # employee_id = id

    #  employee = Employee.find(employee_id)

    #  salary = employee.basic_pay

    #  tax = salary * 0.1 # Example tax calculation (10%)

    #  provident_fund = salary * 0.12 # deduction (12%)

    #  deductions = tax + provident_fund
  end

  # <td> <%= line_chart Employee.joins(:payrolls).group_by_month(:pay_date).sum(:net_salary) %> </td>
end
