class FileImportsController < ApplicationController
  def index
    @data_imported = FileImport.all
    @correct_list = CorrectList.all
  end

  def import
    @test = params[:file].original_filename
    puts "=============#{@test}=========================="
     FileImport.import(params[:file])
     redirect_to root_url, notice: "File imported"
  end

  def new
  end

  def delete
  end
end
