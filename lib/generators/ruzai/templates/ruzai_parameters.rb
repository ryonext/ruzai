class RuzaiParameters < ActiveRecord::Migration
  def change
    add_column :<%= @model_class_name.tableize %>, :suspended_expired_at, :datetime, default: nil
    add_column :<%= @model_class_name.tableize %>, :suspended_count, :integer, default: 0
  end
end
