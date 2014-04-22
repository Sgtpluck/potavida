class CreatePresses < ActiveRecord::Migration
  def change
    create_table :presses do |t|
      t.string :title
      t.string :url
      t.date :pubdate

      t.timestamps
    end
  end
end
