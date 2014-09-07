class RenameCreatedByToUserIdInAuditors < ActiveRecord::Migration
  def change
    rename_column :auditors, :created_by, :user_id
  end
end
