class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :use_id
      t.string :title
      t.date :startday
      t.date :finisyday
      t.string :oneday
      t.text :memo

      t.timestamps
    end
  end
end
