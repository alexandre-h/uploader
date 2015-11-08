class AddFileNameToFileImport < ActiveRecord::Migration
  def change
    add_column :file_imports, :file_name, :string
    add_index :file_imports, :file_name
  end
end
