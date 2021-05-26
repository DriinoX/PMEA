class AddDescriptionToHorses < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :description, :string
  end
end
