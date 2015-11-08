class CorrectList < ActiveRecord::Base
  scope :correct_list,-> (file_name){ where('file_name=:file_name', {file_name: file_name}) }

end
