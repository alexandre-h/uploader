class FileImport < ActiveRecord::Base
  require 'csv'
  include FileImportsHelper

  def first_name=(s)
    write_attribute(:first_name, s.to_s.titleize)
  end

  def last_name=(s)
    write_attribute(:last_name, s.to_s.titleize)
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      FileImport.create! row.to_hash
    end
  end

  before_save :save_correct_data

  private

  def save_correct_data
    email = error_list self
    if email #!FileImport.exists?(email: self.email) && (!FileImport.exists?(first_name: self.first_name, last_name: self.last_name))
      CorrectList.create!(first_name: self.first_name, last_name: self.last_name, email: self.email)
    end
  end

end
