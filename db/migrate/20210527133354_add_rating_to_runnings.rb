class AddRatingToRunnings < ActiveRecord::Migration[6.0]
  def change
    add_column :runnings, :rating, :float
  end
end
