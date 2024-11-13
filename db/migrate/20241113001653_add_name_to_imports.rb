class AddNameToImports < ActiveRecord::Migration[7.1]
  def change
    add_column :imports, :name, :string, null: false
  end
end
