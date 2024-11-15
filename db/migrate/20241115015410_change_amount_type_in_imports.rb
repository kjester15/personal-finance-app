class ChangeAmountTypeInImports < ActiveRecord::Migration[7.1]
  def change
    change_column :imports, :amount, :integer, null: false
  end
end
