class AddPublishedToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :published, :boolean
  end
end
