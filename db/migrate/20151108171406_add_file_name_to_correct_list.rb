class AddFileNameToCorrectList < ActiveRecord::Migration
  def change
    remove_column :correct_lists, :file_name
    add_column :correct_lists, :file_name_id, :integer
  end
end
