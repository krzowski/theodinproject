class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
