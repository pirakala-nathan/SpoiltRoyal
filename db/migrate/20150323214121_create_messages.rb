class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :conversation_id
      t.text :info

      t.timestamps null: false
    end
  end
end
