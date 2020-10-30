class AddServerRefToCounter < ActiveRecord::Migration[6.0]
  def change
    add_reference :counters, :servers, foreign_key: true
  end
end
