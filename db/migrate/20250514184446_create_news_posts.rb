class CreateNewsPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :news_posts do |t|
      t.string :title
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
