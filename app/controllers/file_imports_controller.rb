class FileImportsController < ApplicationController
  def index
    @value = FileImport.new
    @selected_file = params[:file_name]
    if @selected_file.nil?
      @last_file = FileName.last if FileName.last
      @data_imported = FileImport.wrong_data @last_file
      @correct_list = CorrectList.correct_list @last_file
    else
      @last_file = FileName.find @selected_file
      @data_imported = FileImport.wrong_data @last_file
      @correct_list = CorrectList.correct_list @last_file
    end
  end

  def import
    FileImport.import(params[:file])
    redirect_to root_url, notice: "File imported"
  end

  def historique
    @value = FileImport.new
    @selected_file_historic = params[:file_name_historic]
    if @selected_file_historic.nil? || @selected_file_historic.blank?
      @all_data_imported = FileImport.all
    else
      @last_file = FileName.find @selected_file_historic
      @all_data_imported = FileImport.where(file_name: @selected_file_historic)
    end
  end

  def new
  end

  def delete
  end
end
