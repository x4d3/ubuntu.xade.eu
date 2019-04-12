class CreateYoutubeDownloads < ActiveRecord::Migration[5.2]
  def change
    create_table :youtube_downloads do |t|
      t.string :url
      t.string :status
      t.string :error
      t.string :filename
      t.references :user, foreign_key: true
      t.string :uid
      t.boolean :is_audio
      t.timestamps
    end
    add_index :youtube_downloads, :uid
  end
end
