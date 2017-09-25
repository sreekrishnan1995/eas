class AddEvaluatedToAppraisal < ActiveRecord::Migration[5.1]
  def change
    add_column :appraisals, :evaluated, :boolean, :default=>'false'
  end
end
