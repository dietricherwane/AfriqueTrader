class AddVerifiedAndVerifiedByManagerToLinkCompanyToAuditFirms < ActiveRecord::Migration
  def change
    add_column :link_company_to_audit_firms, :verified, :boolean
    add_column :link_company_to_audit_firms, :verified_by, :integer
    add_column :link_company_to_audit_firms, :verified_at, :datetime
    add_column :link_company_to_audit_firms, :verified_by_manager, :boolean
    add_column :link_company_to_audit_firms, :verified_by_manager_id, :integer
    add_column :link_company_to_audit_firms, :verified_by_manager_at, :datetime
  end
end
