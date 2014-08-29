class CreateEventAttendings < ActiveRecord::Migration
  def change
    create_table :event_attendings do |t|
      t.integer :attended_event_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
