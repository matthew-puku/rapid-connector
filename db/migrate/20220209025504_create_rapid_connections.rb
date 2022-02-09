class CreateRapidConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :rapid_connections do |t|
      t.string :nickname
      t.string :secret
      t.string :callback_url

      t.timestamps
    end
  end
end
