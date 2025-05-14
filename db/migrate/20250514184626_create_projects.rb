class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :github_url
      t.string :demo_url
      t.date :started_at
      t.date :finished_at
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
