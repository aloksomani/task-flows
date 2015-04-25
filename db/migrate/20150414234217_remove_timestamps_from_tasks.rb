class RemoveTimestampsFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :created, :datetime
    remove_column :tasks, :updated, :datetime
  end
end
