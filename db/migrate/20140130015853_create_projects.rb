class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :client
      t.text :body
      t.string :status
      t.string :category
      t.integer :hit_counter

      t.timestamps
    end
  end
end
