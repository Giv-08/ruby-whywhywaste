class AddBestsellerToFoods < ActiveRecord::Migration[7.1]
  def change
    add_column :foods, :bestseller, :boolean, default: false
  end
end
