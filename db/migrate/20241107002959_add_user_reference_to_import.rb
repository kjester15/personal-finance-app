class AddUserReferenceToImport < ActiveRecord::Migration[7.1]
  def change
    add_reference :imports, :user, foreign_key: true
  end
end
