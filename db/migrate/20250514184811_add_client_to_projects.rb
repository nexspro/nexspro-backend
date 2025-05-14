class AddClientToProjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :projects, :client, null: false, foreign_key: true
  end
end
