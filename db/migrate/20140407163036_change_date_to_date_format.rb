class ChangeDateToDateFormat < ActiveRecord::Migration
  def change
    remove_column :posts, :date
    add_column :posts, :date, :date
  end
end
