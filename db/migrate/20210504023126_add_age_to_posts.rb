class AddAgeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :age, :integer
  end
end
