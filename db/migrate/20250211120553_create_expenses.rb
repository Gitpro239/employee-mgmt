class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.references :employee
      t.string :category
      t.decimal :amount

      t.timestamps
    end
  end
end
