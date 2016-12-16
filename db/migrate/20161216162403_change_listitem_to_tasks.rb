class ChangeListitemToTasks < ActiveRecord::Migration
  def change
    rename_table :list_items, :tasks
  end
end
