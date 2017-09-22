class CreateAppraisals < ActiveRecord::Migration[5.1]
  def change
    create_table :appraisals do |t|
      t.string :technical_skills
      t.string :communication_skills
      t.string :inter_personal_skills
      t.integer :attendance
      t.string :leadership
      t.integer :self_rating
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
