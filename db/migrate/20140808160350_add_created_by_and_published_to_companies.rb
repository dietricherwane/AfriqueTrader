class AddCreatedByAndPublishedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :created_by, :integer
    add_column :companies, :published, :boolean
  end
end
