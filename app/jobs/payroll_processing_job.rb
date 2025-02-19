class PayrollprocessingJob < ApplicationJob
  queue_as :default

  def perform(employee_id)
    employee = Employee.find(employee_id)

    salary = employee.salary

    tax = salary.basic_pay * 0.1 # Example tax calculation (10%)

    provident_fund = salary.basic_pay * 0.12 # deduction (12%)

    payroll = employee.payrolls.create!(pay_date: Date.today, gross_salary: salary.net_salary, tax_deductions: tax + provident_fund, net_salary: salary.net_salary - tax - provident_fund)
    
    puts "Payroll processed for #{employee.name}: #{payroll.net_salary}"

    # Employee.find_each do |employee|
    # PayrollprocessingJob.perform_later(employee_id)
    # end

  end
end
