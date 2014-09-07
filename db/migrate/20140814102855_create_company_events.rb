class CreateCompanyEvents < ActiveRecord::Migration
  def change
    create_table :company_events do |t|
      t.string :title, limit: 200
      t.text :description
      t.string :location, limit: 200
      t.datetime :starting_at
      t.datetime :ending_at
      t.float :latitude
      t.float :longitude
      t.integer :company_id
      t.boolean :published
      t.integer :user_id

      t.timestamps
    end
  end
end
