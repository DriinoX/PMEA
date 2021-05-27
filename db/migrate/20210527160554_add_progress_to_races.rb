class AddProgressToRaces < ActiveRecord::Migration[6.0]
  def change
    add_column :races, :progress, :integer, default: 0
  end
end
