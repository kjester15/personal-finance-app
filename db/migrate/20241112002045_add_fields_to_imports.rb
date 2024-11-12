class AddFieldsToImports < ActiveRecord::Migration[7.1]
  def change
    add_column :imports, :date, :date, null: false
    add_column :imports, :amount, :float, null: false
    add_column :imports, :card, :string, null: false
    add_column :imports, :vendor, :string, null: false
    remove_column :imports, :file
  end
end
