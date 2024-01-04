# frozen_string_literal: true

class Citizen < ApplicationRecord
  belongs_to :municipy, class_name: 'Municipy'
  has_one_attached :photo

  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  validates :name, presence: true
  validates :birthday, presence: true
  validates :phone, presence: true

  validate :cns_validator
  validate :cpf_validator
  validates :email, format: URI::MailTo::EMAIL_REGEXP

  def cpf_validator
    errors.add(:cpf, :invalid) unless CPF.valid?(cpf)
  end

  def cns_validator
    errors.add(:cns, :invalid) unless CnsValidator.new.valida_cns(cns)
  end
end
