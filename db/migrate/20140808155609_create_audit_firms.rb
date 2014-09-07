class CreateAuditFirms < ActiveRecord::Migration
  def change
    create_table :audit_firms do |t|
      t.integer :country_id
      t.string :name, limit: 50
      t.text :informations
      t.string :address, limit: 100
      t.string :phone_number, limit: 15
      t.string :fax_number, limit: 15
      t.string :email, limit: 50
      t.string :website, limit: 50

      t.timestamps
    end
  end
end
