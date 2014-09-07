class RenameCreatedByToUserIdInAdviceCategory < ActiveRecord::Migration
  def change
    rename_column :advice_categories, :created_by, :user_id
  end
end
