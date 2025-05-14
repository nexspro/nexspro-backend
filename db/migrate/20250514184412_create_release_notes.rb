class CreateReleaseNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :release_notes do |t|
      t.string :version
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
