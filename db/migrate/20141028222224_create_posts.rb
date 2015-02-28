class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :status, :default => "pending"
      t.date :due_date
      t.timestamps
    end
  end
end
