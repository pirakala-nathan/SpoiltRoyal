class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :rails
      t.string :g
      t.string :model
      t.integer :asset_id

      t.timestamps
    end
  end
end
