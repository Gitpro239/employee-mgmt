class RenameSalaryInEmployees < ActiveRecord::Migration[8.0]
  def change
    rename_column :employees, :salary, :basic_pay
    rename_column :employees, :bonus, :allowances

  end
end
