class CreateSlotTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :slot_times do |t|
      t.string :name

      t.timestamps
    end
  end
end
