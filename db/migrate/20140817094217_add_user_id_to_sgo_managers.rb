class AddUserIdToSgoManagers < ActiveRecord::Migration
  def change
    add_column :sgo_managers, :user_id, :integer
  end
end
