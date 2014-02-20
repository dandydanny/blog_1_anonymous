class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.belongs_to :posts
      t.belongs_to :tags
      t.integer :post_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
