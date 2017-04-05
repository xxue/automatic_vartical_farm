class CreateSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :sensors do |t|
      t.float :voltage
      t.float :moisture
      t.date :time

      t.timestamps
    end
  end
end
