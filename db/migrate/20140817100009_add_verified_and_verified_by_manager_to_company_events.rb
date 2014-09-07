class AddVerifiedAndVerifiedByManagerToCompanyEvents < ActiveRecord::Migration
  def change
    add_column :company_events, :verified, :boolean
    add_column :company_events, :verified_by, :integer
    add_column :company_events, :verified_at, :datetime
    add_column :company_events, :verified_by_manager, :boolean
    add_column :company_events, :verified_by_manager_id, :integer
    add_column :company_events, :verified_by_manager_at, :datetime
  end
end
