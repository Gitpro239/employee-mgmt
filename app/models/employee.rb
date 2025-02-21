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

    # Filter Employee scope
    # scope :by_department, ->(department) { where(department: department) }
    # scope :by_role, ->(role) { where(role: role) }
    # scope :by_hire_date, ->(date) { where("hire_date >= ?", date) }

    def self.ransackable_attributes(auth_object = nil)
       [ "allowances", "basic_pay", "created_at", "department_id", "email", "first_name", "hire_date", "id", "last_name", "phone", "role_id", "updated_at" ]
    end

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
