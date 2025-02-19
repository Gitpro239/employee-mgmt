class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :role
      t.references :department
      t.string :phone
      t.decimal :salary
      t.decimal :bonus
      t.date :hire_date


      t.timestamps
    end
  end
end
