class CreateList < ActiveRecord::Migration
  def change
    creat_table :lists do |t|
      t.string :title
      t.boolean :complete, default: false
      t.timestamps null: false
    end
  end
end
