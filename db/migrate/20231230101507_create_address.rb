class CreateAddress < ActiveRecord::Migration[7.0]
  def change
    create_table :address do |t|
      t.timestamps
      t.references :citizen, null: false, foreign_key: true
      t.string :zip_code, null: false, comment: 'the zip code of the address'
      t.string :street, null: false, comment: 'the name of the street of the address'
      t.string :complement, null: false, comment: 'the complement of the address, such as number, apartment, etc.'
      t.string :neighborhood, null: false, comment: 'the name of the neighborhood of the address'
      t.string :city, null: false, comment: 'the name of the city of the address'
      t.string :state, null: false, comment: 'the abbreviation of the state of the address'
      t.string :ibge_code, null: false, comment: 'the IBGE code of the municipality of the address'
    end
  end
end
