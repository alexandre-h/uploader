class FileImport < ActiveRecord::Base
  require 'csv'

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
end
