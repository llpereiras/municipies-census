# frozen_string_literal: true

class BaseQuery
  def self.call(params:, relation: base_relation)
    new(params:, relation:).call
  end

  def initialize(params:, relation: base_relation)
    @relation = relation
    @params = params
  end

  def call
    joins
    paginate
    apply_filters
    order

    relation
  end

  # INFO: overwritable methods
  def self.base_relation; end

  def apply_filters; end

  def order_attributes; end

  def joins; end

  protected

  attr_accessor :relation, :params

  def order
    #  TODO: implement order
    @relation
  end

  def paginate
    #  TODO: implement paginate
    @relation
  end
end
