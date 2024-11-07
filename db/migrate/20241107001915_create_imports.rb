class CreateImports < ActiveRecord::Migration[7.1]
  def change
    create_table :imports do |t|
      t.text :file

      t.timestamps
    end
  end
end
