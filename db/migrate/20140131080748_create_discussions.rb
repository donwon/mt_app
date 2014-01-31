class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :topic
      t.string :title
      t.string :body
      t.references :user, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
