class ChangeDateInImports < ActiveRecord::Migration[7.1]
  def change
    change_column :imports, :date, :string, null: false
  end
end
