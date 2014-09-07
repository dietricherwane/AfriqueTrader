class AddVerifiedAndVerifiedByManagerToAuditReports < ActiveRecord::Migration
  def change
    add_column :audit_reports, :verified, :boolean
    add_column :audit_reports, :verified_by, :integer
    add_column :audit_reports, :verified_at, :datetime
    add_column :audit_reports, :verified_by_manager, :boolean
    add_column :audit_reports, :verified_by_manager_id, :integer
    add_column :audit_reports, :verified_by_manager_at, :datetime
  end
end
