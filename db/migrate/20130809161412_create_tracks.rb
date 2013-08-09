class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :album_id, :null => false
      t.integer :ord, :null => false

      t.timestamps
    end
    add_index :tracks, :name
  end
end
