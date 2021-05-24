class CreateRunnings < ActiveRecord::Migration[6.0]
  def change
    create_table :runnings do |t|
      t.references :horse, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true
      t.integer :position
      t.float :speed
      t.float :acceleration

      t.timestamps
    end
  end
end
