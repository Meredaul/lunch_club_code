class CreatePresences < ActiveRecord::Migration[5.0]
  def change
    create_table :presences do |t|
      t.boolean :attended
      t.boolean :cuisto
      t.references :user, foreign_key: true
      t.references :occurence, foreign_key: true

      t.timestamps
    end
  end
end
