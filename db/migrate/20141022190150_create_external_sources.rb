class CreateExternalSources < ActiveRecord::Migration
  def change
    create_table :external_sources do |t|
      t.string :type

      t.timestamps
    end
  end
end
