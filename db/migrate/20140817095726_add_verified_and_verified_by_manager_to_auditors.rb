class AddVerifiedAndVerifiedByManagerToAuditors < ActiveRecord::Migration
  def change
    add_column :auditors, :verified, :boolean
    add_column :auditors, :verified_by, :integer
    add_column :auditors, :verified_at, :datetime
    add_column :auditors, :verified_by_manager, :boolean
    add_column :auditors, :verified_by_manager_id, :integer
    add_column :auditors, :verified_by_manager_at, :datetime
  end
end
