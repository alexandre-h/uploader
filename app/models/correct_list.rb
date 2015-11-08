class CorrectList < ActiveRecord::Base
  scope :correct_list,-> (file_name){ where('file_name_id=:file_name', {file_name: file_name}) }

  belongs_to :file_name
end
