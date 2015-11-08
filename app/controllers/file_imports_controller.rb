class FileImportsController < ApplicationController
  def index

    puts "===========params ::: #{params[:file_name]}===================="
    @value = FileImport.new
    @last_file = FileImport.last.file_name if FileImport.last
    @data_imported = FileImport.wrong_data @last_file
    @correct_list = CorrectList.correct_list @last_file
  end

  def import
    FileImport.import(params[:file])
    redirect_to root_url, notice: "File imported"
  end

  def historique
    @all_data_imported = FileImport.all
  end

  def new
  end

  def delete
  end
end
