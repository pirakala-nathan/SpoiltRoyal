class CreateParticipantLists < ActiveRecord::Migration
  def change
    create_table :participant_lists do |t|
      t.integer :user_id
      t.integer :conversation_id
      t.timestamps null: false
    end
  end
end
