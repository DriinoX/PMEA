class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.references :horse, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :race, null: false, foreign_key: true
      t.float :sip

      t.timestamps
    end
  end
end
