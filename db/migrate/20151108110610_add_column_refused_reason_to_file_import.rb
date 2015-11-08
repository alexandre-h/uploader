class AddColumnRefusedReasonToFileImport < ActiveRecord::Migration
  def change
    add_column :file_imports, :refused_reason, :string
    add_index :file_imports, :refused_reason
  end
end
