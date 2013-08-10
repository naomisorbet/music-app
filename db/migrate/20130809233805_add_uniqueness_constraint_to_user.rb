class AddUniquenessConstraintToUser < ActiveRecord::Migration
  def up
    remove_column :users, :email
    add_column :users, :email, :string
    add_index :users, :email, :unique => true, :null => false
  end

end
