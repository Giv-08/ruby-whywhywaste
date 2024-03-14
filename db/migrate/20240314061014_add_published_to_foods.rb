class AddPublishedToFoods < ActiveRecord::Migration[7.1]
  def change
    add_column :foods, :published, :boolean, null: false, default: false
  end
end
