class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :post, foreign_key: true
      t.references :trouble, foreign_key: true

      t.timestamps
    end
  end
end
