class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :day
      t.time :start_time
      t.string :category
      t.string :destination
      t.string :memo
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
