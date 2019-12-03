class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.datetime :starts_on
      t.datetime :ends_on
      t.integer :user_id

      t.timestamps
    end
  end
end
