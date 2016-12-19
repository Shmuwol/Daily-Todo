class AddUserIdToLists < ActiveRecord::Migration
  def change
    add_calumn :user_id, :integer
  end
end
