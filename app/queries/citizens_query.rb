# frozen_string_literal: true

class CitizensQuery < BaseQuery
  def self.base_relation
    query_table.all
  end

  def self.query_table
    Citizen
  end

  def apply_filters
    filter_by_id
    filter_by_name_start
  end

  def order_attributes
    {
      name_asc: 'citizens.name asc',
      name_desc: 'citizens.name desc',
      id_asc: 'citizens.id asc',
      id_desc: 'citizens.id desc'
    }
  end

  private

  def filter_by_id
    return if params[:id].blank?

    @relation = relation.where(id: params[:id])
  end

  def filter_by_name_start
    return if params[:name_start].blank?

    citizens = self.class.query_table.arel_table
    @relation = relation.where(
      citizens[:name].matches("#{params[:name_start]}%")
    )
  end

  def order; end
end
