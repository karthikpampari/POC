class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.date :day
      t.datetime :time
      t.integer :members
      t.integer :table

      t.timestamps
    end
  end
end
