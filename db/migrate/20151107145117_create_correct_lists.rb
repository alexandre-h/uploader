class CreateCorrectLists < ActiveRecord::Migration
  def changeFil
    create_table :correct_lists do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps null: false
    end
  end
end