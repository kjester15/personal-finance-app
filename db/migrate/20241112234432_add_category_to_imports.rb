class AddCategoryToImports < ActiveRecord::Migration[7.1]
  def change
    add_column :imports, :category, :string, null: false
  end
end
