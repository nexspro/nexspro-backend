class CreateSkills < ActiveRecord::Migration[8.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :level
      t.string :icon

      t.timestamps
    end
  end
end
