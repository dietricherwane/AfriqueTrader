class CreateSgoManagers < ActiveRecord::Migration
  def change
    create_table :sgo_managers do |t|
      t.string :firstname, limit: 100
      t.string :lastname, limit: 100
      t.string :position, limit: 100
      t.string :phone_number, limit: 16
      t.string :mobile_number, limit: 16
      t.string :email, limit: 100
      t.boolean :published
      t.integer :sgo_id

      t.timestamps
    end
  end
end
