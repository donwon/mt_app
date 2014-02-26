class MakeCommentsPolymorphic < ActiveRecord::Migration
  def change
    rename_column :comments, :discussion_id, :commentable_id
    add_column :comments, :commentable_type, :string
    add_index :comments, [:commentable_type, :commentable_id]
    Comment.update_all(commentable_type: "Discussion")
  end
end
