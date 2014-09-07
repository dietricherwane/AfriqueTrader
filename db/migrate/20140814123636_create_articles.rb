class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :article_category_id
      t.string :title, limit: 200
      t.text :description
      t.integer :user_id
      t.boolean :published

      t.timestamps
    end
  end
end
