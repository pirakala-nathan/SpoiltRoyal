class CreateLocationOptions < ActiveRecord::Migration
  def change
    create_table :location_options do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
