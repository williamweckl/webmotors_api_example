class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.references :brand, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :webmotors_id, null: false

      t.timestamps null: false
    end
  end
end
