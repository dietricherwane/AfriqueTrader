class RenameCreatedByToUserIdInAuditReports < ActiveRecord::Migration
  def change
    rename_column :audit_reports, :created_by, :user_id
  end
end
