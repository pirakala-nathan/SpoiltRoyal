class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :subject
      t.date :last_msg
      t.timestamps null: false
    end
  end
end
