class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :start_airport
      t.integer :finish_airport
      t.date :depature_date
      t.integer :duration

      t.timestamps
    end
  end
end
