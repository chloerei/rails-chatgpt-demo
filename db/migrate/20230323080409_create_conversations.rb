class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|

      t.timestamps
    end
  end
end
