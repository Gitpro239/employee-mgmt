class Employee < ApplicationRecord
    paginates_per 5

    belongs_to :role
    belongs_to :department
    has_one :salary
    has_many :payrolls
    has_many :leaves
    has_many :expenses
    has_many :reimbursements

    validates :first_name, :last_name, presence: true, length: { minimum: 4, maximum: 15 }
    validates :role, :department, :hire_date, presence: true
    validates :email, presence: true, uniqueness: true
    validates :phone, numericality: true, uniqueness: true
    validates :phone, presence: true

    def perform
        employee_id = self.id # employee_id = id

        employee = Employee.find(employee_id)

        salary = employee.basic_pay

        tax = salary * 0.1 # Example tax calculation (10%)

        provident_fund = salary * 0.12 # deduction (12%)

        deductions = tax + provident_fund

        net_salary = employee.basic_pay + employee.allowances - deductions

        net_salary
    end
end
