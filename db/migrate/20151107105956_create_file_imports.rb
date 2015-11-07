class CreateFileImports < ActiveRecord::Migration
  def change
    create_table :file_imports do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.timestamps null: false
    end
  end
end
