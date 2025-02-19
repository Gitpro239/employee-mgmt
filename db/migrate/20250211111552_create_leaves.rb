class CreateLeaves < ActiveRecord::Migration[8.0]
  def change
    create_table :leaves do |t|
      t.references :employee
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
