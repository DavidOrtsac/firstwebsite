class CreateHomeworks < ActiveRecord::Migration[7.0]
  def change
    create_table :homeworks do |t|
      t.string :title
      t.string :due_date
      t.string :category
      t.string :subject
      t.string :status

      t.timestamps
    end
  end
end
