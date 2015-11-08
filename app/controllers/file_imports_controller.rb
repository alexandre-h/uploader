class FileImportsController < ApplicationController
  def index
    @data_imported = FileImport.wrong_data
    @correct_list = CorrectList.all
  end

  def import
    FileImport.import(params[:file])
    redirect_to root_url, notice: "File imported"
  end

  def new
  end

  def delete
  end
end
