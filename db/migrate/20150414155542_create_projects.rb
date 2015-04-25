class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :completed
      t.float :percent_completed
      t.timestamp :created
      t.timestamp :updated
      t.timestamp :completed
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
