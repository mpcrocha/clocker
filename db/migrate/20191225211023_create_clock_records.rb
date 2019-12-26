class CreateClockRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :clock_records do |t|
      t.string :clock_type, :length => 3
      t.datetime :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
