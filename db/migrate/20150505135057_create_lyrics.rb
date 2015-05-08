class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.references :artist
      t.references :album
      t.references :user
      t.integer :track_number
      t.string :track_name
      t.text :lyrics

      t.timestamps
    end

    add_index :lyrics, :artist_id
    add_index :lyrics, :album_id
    add_index :lyrics, :user_id
    add_index :lyrics, :track_number
  end
end
