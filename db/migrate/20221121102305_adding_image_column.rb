class AddingImageColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :image, :string, default: "carrots.jpg"
    add_column :items, :food_type, :string 
  end
end
