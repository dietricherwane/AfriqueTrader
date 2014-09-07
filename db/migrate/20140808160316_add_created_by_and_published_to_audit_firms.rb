class AddCreatedByAndPublishedToAuditFirms < ActiveRecord::Migration
  def change
    add_column :audit_firms, :created_by, :integer
    add_column :audit_firms, :published, :boolean
  end
end
