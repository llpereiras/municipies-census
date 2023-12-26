# frozen_string_literal: true

class Municipy < ApplicationRecord
  enum status: {
    active: 'active',
    inactive: 'inactive'
  }
end
