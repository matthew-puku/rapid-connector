# frozen_string_literal: true

class AddPreferredEntityIdToRapidConnections < ActiveRecord::Migration[7.0]
  def change
    add_column :rapid_connections, :preferred_entity_id, :string
  end
end
