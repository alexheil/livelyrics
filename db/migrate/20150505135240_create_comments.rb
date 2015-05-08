class CreateComments < ActiveRecord::Migration
  def change
    create_table(:comments) do |t|
      t.references :lyric
      t.references :user
      t.string :username
      t.text :content

      t.timestamps
    end

    add_index :comments, :lyric_id
    add_index :comments, :user_id
    add_index :comments, :username
  end
end
