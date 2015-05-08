class AddSlugToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :slug, :string
    add_index :artists, :slug, unique: true
    add_column :albums, :slug, :string
    add_index :albums, :slug, unique: true
    add_column :lyrics, :slug, :string
    add_index :lyrics, :slug, unique: true
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
end
