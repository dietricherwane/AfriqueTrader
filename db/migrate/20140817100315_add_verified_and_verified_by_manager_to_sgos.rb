class AddVerifiedAndVerifiedByManagerToSgos < ActiveRecord::Migration
  def change
    add_column :sgos, :verified, :boolean
    add_column :sgos, :verified_by, :integer
    add_column :sgos, :verified_at, :datetime
    add_column :sgos, :verified_by_manager, :boolean
    add_column :sgos, :verified_by_manager_id, :integer
    add_column :sgos, :verified_by_manager_at, :datetime
  end
end
