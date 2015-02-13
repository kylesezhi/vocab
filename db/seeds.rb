# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

list1 = List.create(name: "BJT")

CSV.foreach('csv/BJT.csv', :headers => true) do |row|
  japanese = row['japanese'].nil? ? "" : row['japanese']
  english = row['english'].nil? ? "" : row['english']
  Entry.create(japanese: japanese, english: english, list: list1)
end


list2 = List.create(name: "Eng Jap Uni vocab")

CSV.foreach('csv/Eng Jap Uni vocab.csv', :headers => true) do |row|
  japanese = row['japanese'].nil? ? "" : row['japanese']
  english = row['english'].nil? ? "" : row['english']
  Entry.create(japanese: japanese, english: english, list: list2)
end