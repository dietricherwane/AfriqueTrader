class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :subscription_period_id
      t.integer :user_id
      t.boolean :enabled
      t.datetime :starting_at
      t.integer :disabled_by
      t.datetime :disabled_at
      t.datetime :enabled_at
      t.integer :enabled_by

      t.timestamps
    end
  end
end
