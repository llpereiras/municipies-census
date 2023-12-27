class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.timestamps
      t.references :municipy, null: false, foreign_key: true
      t.string :name, null: false, comment: 'the name of the citizen'
      t.string :cpf, null: false, comment: 'the CPF (Cadastro de Pessoas Físicas) number of the citizen, a unique identifier for individuals in Brazil'
      t.string :cns, null: false, comment: 'the CNS (Cartão Nacional de Saúde) number of the citizen, a unique identifier for health services in Brazil'
      t.string :email, null: false, comment: 'the email address of the citizen'
      t.date :birthday, null: false, comment: 'the date of birth of the citizen'
      t.string :phone, null: false, comment: 'the phone number of the citizen'
      t.string :status, null: false, default: 'active', comment: 'the status of the citizen, such as active, inactive, etc.'
    end
  end
end
