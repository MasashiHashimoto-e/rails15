class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :user_id, :string
    add_column :posts, :finishday, :date
  end
end
