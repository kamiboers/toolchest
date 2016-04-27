class ToolsChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default :tools, :inventory, 0
  end
end
