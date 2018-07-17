class ChangeDefaultValueToFalse < ActiveRecord::Migration[5.1]
  def up
    change_column :articles, :IsCompleted, :boolean, default: false
  end
end
