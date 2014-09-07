class CreateAuditors < ActiveRecord::Migration
  def change
    create_table :auditors do |t|
      t.string :uuid, limit: 50
      t.integer :audit_firm_id
      t.integer :country_id
      t.string :position, limit: 100
      t.string :firstname, limit: 50
      t.string :lastname, limit: 100
      t.string :phone_number, limit: 20
      t.string :email, limit: 100

      t.timestamps
    end
  end
end
