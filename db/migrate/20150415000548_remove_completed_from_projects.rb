class RemoveCompletedFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :completed, :datetime
  end
end
