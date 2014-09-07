class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :publication_category_id
      t.string :title, limit: 200
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
