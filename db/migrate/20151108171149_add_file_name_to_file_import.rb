class AddFileNameToFileImport < ActiveRecord::Migration
  def change
    add_column :file_imports, :file_name_id, :integer
  end
end
