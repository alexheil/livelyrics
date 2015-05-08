class CreateAlbums < ActiveRecord::Migration
  def change
    create_table(:albums) do |t|
      t.references :artist
      t.string :name
      t.integer :year
      t.string :cover_art_url

      t.timestamps
    end

    add_index :albums, :artist_id
  end
end
