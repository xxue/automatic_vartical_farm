class RemoveTimeFromSensors < ActiveRecord::Migration[5.0]
  def change
    remove_column :sensors, :time, :date
  end
end
