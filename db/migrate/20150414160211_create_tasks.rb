class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :completed
      t.timestamp :created
      t.timestamp :updated
      t.timestamp :completed
      t.references :milestone, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
