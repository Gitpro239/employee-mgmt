class CreatePayrolls < ActiveRecord::Migration[8.0]
  def change
    create_table :payrolls do |t|
      t.references :employee
      t.date :pay_date
      t.decimal :gross_salary
      t.decimal :tax_deductions
      t.decimal :net_salary

      t.timestamps
    end
  end
end
