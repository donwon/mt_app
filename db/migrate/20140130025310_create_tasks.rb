class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :due_date
      t.string :assignees
      t.boolean :completed, default: false
      t.references :user, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
