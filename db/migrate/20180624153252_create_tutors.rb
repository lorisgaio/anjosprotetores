class CreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :cpf
      t.string :address
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :phone
      t.text :obs

      t.timestamps
    end
  end
end
