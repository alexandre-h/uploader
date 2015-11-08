class AddFileNameToCorrectList < ActiveRecord::Migration
  def change
    add_column :correct_lists, :file_name, :string
    add_index :correct_lists, :file_name
  end
end
