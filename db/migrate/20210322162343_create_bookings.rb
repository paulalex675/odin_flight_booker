class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.int, :flight_id
      t.int :number_of_passengers

      t.timestamps
    end
  end
end
