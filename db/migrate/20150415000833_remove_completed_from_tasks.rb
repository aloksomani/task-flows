class RemoveCompletedFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :completed, :datetime
  end
end
