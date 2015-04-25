class AddCompletedToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :completed, :boolean
  end
end
