class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :content
      t.string :country
      t.string :supervision
      t.string :title
      t.float :rate
      t.timestamps
    end
  end
end
