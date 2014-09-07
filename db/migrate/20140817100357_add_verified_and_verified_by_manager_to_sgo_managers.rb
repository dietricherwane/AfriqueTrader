class AddVerifiedAndVerifiedByManagerToSgoManagers < ActiveRecord::Migration
  def change
    add_column :sgo_managers, :verified, :boolean
    add_column :sgo_managers, :verified_by, :integer
    add_column :sgo_managers, :verified_at, :datetime
    add_column :sgo_managers, :verified_by_manager, :boolean
    add_column :sgo_managers, :verified_by_manager_id, :integer
    add_column :sgo_managers, :verified_by_manager_at, :datetime
  end
end
