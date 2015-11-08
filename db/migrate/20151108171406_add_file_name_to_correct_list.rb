class AddFileNameToCorrectList < ActiveRecord::Migration
  def change
    add_column :correct_lists, :file_name_id, :integer
  end
end
