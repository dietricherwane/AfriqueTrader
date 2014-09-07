class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :sticker, limit: 50
      t.integer :sales_area_id
      t.integer :country_id
      t.string :name, limit: 50
      t.text :description
      t.string :address, limit: 100
      t.string :phone_number, limit: 15
      t.string :fax_number, limit: 15
      t.string :email, limit: 50
      t.string :website, limit: 100

      t.timestamps
    end
  end
end
