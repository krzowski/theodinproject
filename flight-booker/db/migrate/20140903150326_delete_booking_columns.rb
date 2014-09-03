class DeleteBookingColumns < ActiveRecord::Migration
  def change
    remove_column :bookings, :address
    remove_column :bookings, :phone
  end
end
