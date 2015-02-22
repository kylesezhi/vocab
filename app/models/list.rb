class List < ActiveRecord::Base
  has_many :entries

  require 'csv'

  def self.convert(name, filepath)
    list1 = List.create(name: name)
    CSV.foreach(filepath, :headers => true) do |row|
      japanese = row['japanese'].nil? ? "" : row['japanese']
      english = row['english'].nil? ? "" : row['english']
      Entry.create(japanese: japanese, english: english, list: list1)
    end
  end
end
