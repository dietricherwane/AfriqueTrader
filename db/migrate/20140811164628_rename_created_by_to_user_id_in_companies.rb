class RenameCreatedByToUserIdInCompanies < ActiveRecord::Migration
  def change
    rename_column :companies, :created_by, :user_id
  end
end
