class CreateLinkCompanyToAuditFirms < ActiveRecord::Migration
  def change
    create_table :link_company_to_audit_firms do |t|
      t.integer :company_id
      t.integer :audit_firm_id
      t.integer :year
      t.integer :created_by

      t.timestamps
    end
  end
end
