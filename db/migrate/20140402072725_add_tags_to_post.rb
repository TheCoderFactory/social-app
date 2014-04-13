class AddTagsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :tags, :string
    add_index :posts, :tags
  end

end
