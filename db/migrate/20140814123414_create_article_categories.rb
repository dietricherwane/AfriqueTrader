class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :name
      t.boolean :published
      t.integer :user_id

      t.timestamps
    end
  end
end
