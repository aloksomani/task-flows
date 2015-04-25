class RemoveTimestampsFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :created, :datetime
    remove_column :projects, :updated, :datetime
  end
end
