class FileImport < ActiveRecord::Base
  require 'csv'
  require 'roo'
  include FileImportsHelper

  scope :wrong_data, -> (file_name){ where('refused_reason IS NOT NULL AND file_name_id=:file_name', {file_name: file_name} )}
  belongs_to :file_name

  def first_name=(s)
    write_attribute(:first_name, s.to_s.titleize)
  end

  def last_name=(s)
    write_attribute(:last_name, s.to_s.titleize)
  end
  #
  # def self.import(file)
  #   FileName.create!(file_name: file.original_filename)
  #   file_up = FileName.last
  #   filename = {file_name: file_up}
  #   CSV.foreach(file.path, headers: true) do |row|
  #     FileImport.create! row.to_hash.merge filename
  #   end
  # end

  def self.import(file)
    FileName.create!(file_name: file.original_filename)
    file_up = FileName.last
    filename = {file_name: file_up}
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
#    puts "=====================iiiiiiiiiiii=#{header}======================"
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts "=====================iiiiiiiiiiiirow=#{row}======================"
      FileImport.create! row.to_hash.merge filename
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, header:true)
      when '.xls' then Roo::Excel.new(file.path, headers:true)
      when '.xlsx' then Roo::Excelx.new(file.path, headers:true)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  before_save :save_correct_data

  private

  def save_correct_data
    email = error_list self
    if email
      CorrectList.create!(first_name: self.first_name, last_name: self.last_name, email: self.email, file_name: self.file_name)
    end
  end

end
