class CreateSgos < ActiveRecord::Migration
  def change
    create_table :sgos do |t|
      t.string :name, limit: 100
      t.date :created_date
      t.float :capital
      t.string :email, limit: 100
      t.integer :social_status_id
      t.integer :user_id
      t.string :phone_number, limit: 16
      t.string :fax_number, limit: 16
      t.string :website, limit: 100
      t.integer :country_id

      t.timestamps
    end
  end
end
