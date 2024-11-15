class ChangeAmountTypeInImportsToDecimal < ActiveRecord::Migration[7.1]
  def change
    change_column :imports, :amount, :decimal, :precision => 2, null: false
  end
end
