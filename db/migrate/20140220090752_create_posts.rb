class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      validates :title, :body, :prescence true

      t.timestamps
    end
  end
end
