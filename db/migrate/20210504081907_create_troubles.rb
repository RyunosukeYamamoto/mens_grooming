class CreateTroubles < ActiveRecord::Migration[5.2]
  def change
    create_table :troubles do |t|
      t.string :word

      t.timestamps
    end
  end
end
