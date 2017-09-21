class AddIndexToEmployeesEmpId < ActiveRecord::Migration[5.1]
  def change
    add_index :employees, :emp_id, unique: true
  end
end
