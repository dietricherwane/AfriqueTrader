class RenameCreatedByToUserIdInAuditFirm < ActiveRecord::Migration
  def change
    rename_column :audit_firms, :created_by, :user_id
  end
end
