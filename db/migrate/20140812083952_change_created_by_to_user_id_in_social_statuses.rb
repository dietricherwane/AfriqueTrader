class ChangeCreatedByToUserIdInSocialStatuses < ActiveRecord::Migration
  def change
    rename_column :social_statuses, :created_by, :user_id
  end
end
