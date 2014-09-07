class AddSgoIdToInvestmentCompany < ActiveRecord::Migration
  def change
    add_column :investment_companies, :sgo_id, :integer
  end
end
