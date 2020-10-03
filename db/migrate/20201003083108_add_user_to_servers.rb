class AddUserToServers < ActiveRecord::Migration[6.0]
  def change
    add_reference :servers, :user, null: false, foreign_key: true
  end
end
