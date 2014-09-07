class CreateInvestmentCompanyCategories < ActiveRecord::Migration
  def change
    create_table :investment_company_categories do |t|
      t.string :name
      t.boolean :published
      t.integer :user_id

      t.timestamps
    end
  end
end
