# frozen_string_literal: true

class MunicipiesQuery < BaseQuery
  def self.base_relation
    query_table.all
  end

  def self.query_table
    Municipy
  end

  def apply_filters
    filter_by_id
    filter_by_name_start
  end

  def order_attributes
    {
      name_asc: 'municipies.name asc',
      name_desc: 'municipies.name desc',
      id_asc: 'municipies.id asc',
      id_desc: 'municipies.id desc'
    }
  end

  private

  def filter_by_id
    return if params[:id].blank?

    @relation = relation.where(id: params[:id])
  end

  def filter_by_name_start
    return if params[:name_start].blank?

    municipies = self.class.query_table.arel_table
    @relation = relation.where(
      municipies[:name].matches("#{params[:name_start]}%")
    )
  end

  def order; end
end
