class CreateCounters < ActiveRecord::Migration[6.0]
  def change
    create_table :counters do |t|
      t.string :code
      t.float :delay

      t.timestamps
    end
  end
end
