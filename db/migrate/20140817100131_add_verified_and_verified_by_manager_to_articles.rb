class AddVerifiedAndVerifiedByManagerToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :verified, :boolean
    add_column :articles, :verified_by, :integer
    add_column :articles, :verified_at, :datetime
    add_column :articles, :verified_by_manager, :boolean
    add_column :articles, :verified_by_manager_id, :integer
    add_column :articles, :verified_by_manager_at, :datetime
  end
end
