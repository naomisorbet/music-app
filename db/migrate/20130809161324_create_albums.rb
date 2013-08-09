class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, :null => false
      t.date :date
      t.integer :band_id, :null =>false

      t.timestamps
    end
    add_index :albums, :name
    add_index :albums, :band_id
  end
end
