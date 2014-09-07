class CreateAdvices < ActiveRecord::Migration
  def change
    create_table :advices do |t|
      t.integer :advice_category_id
      t.integer :company_id
      t.string :title, limit: 200
      t.text :description
      t.integer :user_id
      t.boolean :published

      t.timestamps
    end
  end
end
