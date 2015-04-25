class RemoveCompletedFromMilestones < ActiveRecord::Migration
  def change
    remove_column :milestones, :completed, :datetime
  end
end
