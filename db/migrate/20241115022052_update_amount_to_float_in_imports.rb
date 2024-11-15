class UpdateAmountToFloatInImports < ActiveRecord::Migration[7.1]
  def change
    change_column :imports, :amount, :float, null: false
  end
end
