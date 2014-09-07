class CreateInvestmentCompanies < ActiveRecord::Migration
  def change
    create_table :investment_companies do |t|
      t.integer :investment_company_category_id
      t.float :selling_amount
      t.text :description
      t.integer :user_id
      t.boolean :published
      t.integer :social_status_id
      t.string :email, limit: 100
      t.text :phone_number, limit: 16
      t.text :fax_number, limit: 16
      t.string :website, limit: 100
      t.integer :country_id

      t.timestamps
    end
  end
end
