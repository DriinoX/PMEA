class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :share_link
      t.references :race, null: false, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
