class AddingDefault < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :total ,:decimal
    add_column :orders, :total, :decimal ,default: 0
  end
end
