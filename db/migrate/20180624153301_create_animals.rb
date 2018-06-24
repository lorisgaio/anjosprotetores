class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.references :tutor, optional: true, foreign_key: true
      t.datetime :date_entry
      t.string :name
      t.string :breed
      t.integer :age
      t.string :color
      t.integer :gender
      t.boolean :castrated
      t.boolean :vaccinated
      t.boolean :dewormed
      t.boolean :died
      t.string :chip_n
      t.string :veterinary
      t.text :diagnostic
      t.text :treatment
      t.text :obs
      t.datetime :adoption_date

      t.timestamps
    end
  end
end
