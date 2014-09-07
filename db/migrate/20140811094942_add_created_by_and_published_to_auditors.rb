class AddCreatedByAndPublishedToAuditors < ActiveRecord::Migration
  def change
    add_column :auditors, :created_by, :integer
    add_column :auditors, :published, :boolean
  end
end
