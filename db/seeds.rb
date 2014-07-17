# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in 0...90
  TodoItem.create(content: 'Finish updating views', repo_id: i)
  TodoItem.create(content: 'Get API to work properly', repo_id: i)
  TodoItem.create(content: 'Fix feature to add notes', repo_id: i)
end

