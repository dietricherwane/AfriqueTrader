class CreateAdviceCategories < ActiveRecord::Migration
  def change
    create_table :advice_categories do |t|
      t.string :name, limit: 50
      t.integer :created_by
      t.boolean :published

      t.timestamps
    end
  end
end
