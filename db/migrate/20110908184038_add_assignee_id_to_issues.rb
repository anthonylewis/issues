class AddAssigneeIdToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :assignee_id, :integer
  end

  def self.down
    remove_column :issues, :assignee_id
  end
end
