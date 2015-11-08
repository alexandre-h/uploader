class FileImport < ActiveRecord::Base
  require 'csv'
  include FileImportsHelper

  scope :wrong_data, -> { where('refused_reason IS NOT NULL') }

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
    if email
      CorrectList.create!(first_name: self.first_name, last_name: self.last_name, email: self.email)
    end
  end

end
