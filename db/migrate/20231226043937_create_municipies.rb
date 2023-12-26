class CreateMunicipies < ActiveRecord::Migration[7.0]
  def change
    create_table :municipies do |t|
      t.timestamps

      t.string :name, comment: 'Name of municipy', null: false
      t.string :status, comment: 'Status of Municipy', default: 'active'
    end
  end
end
