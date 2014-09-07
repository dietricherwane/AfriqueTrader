class AddVerifiedAndVerifiedByManagerToAuditFirms < ActiveRecord::Migration
  def change
    add_column :audit_firms, :verified, :boolean
    add_column :audit_firms, :verified_by, :integer
    add_column :audit_firms, :verified_at, :datetime
    add_column :audit_firms, :verified_by_manager, :boolean
    add_column :audit_firms, :verified_by_manager_id, :integer
    add_column :audit_firms, :verified_by_manager_at, :datetime
  end
end
