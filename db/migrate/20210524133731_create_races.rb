class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|

      t.timestamps
    end
  end
end
