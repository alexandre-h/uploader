class CreateFileNames < ActiveRecord::Migration
  def change
    create_table :file_names do |t|
      t.string :file_name
      t.timestamps null: false
    end
  end
end
