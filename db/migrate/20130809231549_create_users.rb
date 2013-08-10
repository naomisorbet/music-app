class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :password, :null => false
      t.integer :admin
      t.string :session_token

      t.timestamps
    end
    add_index :users, :email
  end
end
