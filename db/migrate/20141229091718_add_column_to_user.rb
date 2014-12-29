class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :astronaut, :boolean
  end
end
