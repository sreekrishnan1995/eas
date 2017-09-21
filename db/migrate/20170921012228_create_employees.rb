class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :emp_id
      t.string :name
      t.string :designation
      t.string :superior_id

      t.timestamps
    end
  end
end
