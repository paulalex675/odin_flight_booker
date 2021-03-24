class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.integer :depart_city_id
      t.integer :arrive_city_id
      t.datetime :scheduled_to_depart

      t.timestamps
    end
  end
end
