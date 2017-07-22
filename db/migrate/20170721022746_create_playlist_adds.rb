class CreatePlaylistAdds < ActiveRecord::Migration[5.1]
  def change
    create_table :playlist_adds do |t|
      t.integer :user_id
      t.integer :song_id

      t.timestamps
    end
  end
end
