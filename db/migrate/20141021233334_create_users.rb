class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :account_type
      t.boolean :admin
      t.references :account, polymorphic: true

      t.timestamps
    end
  end
end
