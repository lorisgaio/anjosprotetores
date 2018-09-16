class AddSpeciesToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :species, :integer
  end
end
