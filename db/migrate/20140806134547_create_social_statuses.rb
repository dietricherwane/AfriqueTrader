class CreateSocialStatuses < ActiveRecord::Migration
  def change
    create_table :social_statuses do |t|
      t.string :name, limit: 50
      t.boolean :published
      t.integer :created_by

      t.timestamps
    end
  end
end
