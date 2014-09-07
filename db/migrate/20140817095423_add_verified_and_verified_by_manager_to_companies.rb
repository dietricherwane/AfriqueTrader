class AddVerifiedAndVerifiedByManagerToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :verified, :boolean
    add_column :companies, :verified_by, :integer
    add_column :companies, :verified_at, :datetime
    add_column :companies, :verified_by_manager, :boolean
    add_column :companies, :verified_by_manager_id, :integer
    add_column :companies, :verified_by_manager_at, :datetime
  end
end
