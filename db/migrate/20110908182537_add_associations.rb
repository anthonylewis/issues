class AddAssociations < ActiveRecord::Migration
  def self.up
    add_column :issues, :user_id, :integer
    add_column :notes, :user_id, :integer
  end

  def self.down
    remove_column :issues, :user_id
    remove_column :notes, :user_id
  end
end
