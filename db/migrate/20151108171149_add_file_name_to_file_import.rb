class AddFileNameToFileImport < ActiveRecord::Migration
  def change
    remove_column :file_imports, :file_name
    add_column :file_imports, :file_name_id, :integer
  end
end
