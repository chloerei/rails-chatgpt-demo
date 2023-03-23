class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.belongs_to :conversation

      t.text :content

      t.integer :role, default: 0
      t.integer :status, default: 0

      t.json :response

      t.timestamps
    end
  end
end
