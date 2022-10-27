class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :assignment
      t.string :due_date
      t.string :type
      t.string :subject

      t.timestamps
    end
  end
end
