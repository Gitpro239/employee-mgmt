class CreateSalaries < ActiveRecord::Migration[8.0]
  def change
    create_table :salaries do |t|
      t.references :employee
      t.decimal :basic_pay
      t.decimal :allowances
      t.decimal :deductions

      t.timestamps
    end
  end
end
