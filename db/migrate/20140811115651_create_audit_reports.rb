class CreateAuditReports < ActiveRecord::Migration
  def change
    create_table :audit_reports do |t|
      t.integer :company_id
      t.integer :audit_firm_id
      t.text :description
      t.integer :year
      t.integer :created_by

      t.timestamps
    end
  end
end
