class RemoveSkinTypeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :skin_type, :string
  end
end
