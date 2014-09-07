class CreateSubscriptionPeriods < ActiveRecord::Migration
  def change
    create_table :subscription_periods do |t|
      t.integer :amount
      t.boolean :published

      t.timestamps
    end
  end
end
