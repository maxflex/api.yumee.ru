# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
['cities', 'plans'].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE")
end

City.create({id: 1, name: 'Москва'})

Plan.create([
  {
    id: 1,
    title: 'Похудеть',
    description: 'Кол-во каллорий меньше суточной нормы'
  },
  {
    id: 2,
    title: 'Быть в форме',
    description: 'Кол-во каллорий равно суточной норме'
  },
  {
    id: 3,
    title: 'Набрать массу',
    description: 'Кол-во каллорий больше суточной нормы'
  }
])