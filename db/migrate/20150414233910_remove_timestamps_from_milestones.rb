class RemoveTimestampsFromMilestones < ActiveRecord::Migration
  def change
    remove_column :milestones, :created, :datetime
    remove_column :milestones, :updated, :datetime
  end
end
