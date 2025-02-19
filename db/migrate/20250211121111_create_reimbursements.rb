class CreateReimbursements < ActiveRecord::Migration[8.0]
  def change
    create_table :reimbursements do |t|
      t.references :employee
      t.decimal :amount
      t.string :status

      t.timestamps
    end
  end
end
