class AddAuditFirmIdToAuditFirms < ActiveRecord::Migration
  def change
    add_column :audit_firms, :audit_firm_id, :string, limit: 50
  end
end
