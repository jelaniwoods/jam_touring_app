class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.datetime :arrives_on
      t.datetime :departs_on
      t.string :weather
      t.float :exchange_rate
      t.string :local_currency
      t.integer :tour_id

      t.timestamps
    end
  end
end
