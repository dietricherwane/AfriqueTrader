class AddVerifiedAndVerifiedByManagerToInvestmentCompanies < ActiveRecord::Migration
  def change
    add_column :investment_companies, :verified, :boolean
    add_column :investment_companies, :verified_by, :integer
    add_column :investment_companies, :verified_at, :datetime
    add_column :investment_companies, :verified_by_manager, :boolean
    add_column :investment_companies, :verified_by_manager_id, :integer
    add_column :investment_companies, :verified_by_manager_at, :datetime
  end
end
