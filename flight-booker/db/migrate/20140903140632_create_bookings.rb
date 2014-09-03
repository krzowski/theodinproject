class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
