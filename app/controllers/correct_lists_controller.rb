class CorrectListsController < ApplicationController
  def index
    @all_correct_list = CorrectList.all
    @data_imported = FileImport.wrong_data @last_file
  end

end
