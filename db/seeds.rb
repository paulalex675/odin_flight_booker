# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


tables = ActiveRecord::Base.connection.tables - ['schema_migrations']

# In PostgreSQL, it does not do this automatically. You can use TRUNCATE TABLE table RESTART IDENTITY;
#tables.each do |table|
 # ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE")
#end

# In SQLite, there is no TRUNCATE statement, instead, it's
 tables.each do |table|
   ActiveRecord::Base.connection.execute "DELETE FROM `#{table}`"
   ActiveRecord::Base.connection.execute "DELETE FROM sqlite_sequence WHERE name='#{table}'"
 end

cities = City.create([
  { name: 'Kings Landing' },
  { name: 'Dorne' },
  { name: 'Winterfell' },
  { name: 'Riverrun' },
  { name: 'High Garden' }
  ])

  flights = Flight.create([
    { depart_city_id: cities.first.id, arrive_city_id: cities.second.id, scheduled_to_depart: "2021-09-25 08:30:00" },
    { depart_city_id: cities.first.id, arrive_city_id: cities.third.id, scheduled_to_depart: "2021-08-25 08:30:00" },
    { depart_city_id: cities.first.id, arrive_city_id: cities.fourth.id, scheduled_to_depart: "2021-07-25 07:30:00" },
    { depart_city_id: cities.first.id, arrive_city_id: cities.last.id, scheduled_to_depart: "2021-06-25 09:00:00" },
    { depart_city_id: cities.second.id, arrive_city_id: cities.first.id, scheduled_to_depart: "2021-09-25 10:00:00" },
    { depart_city_id: cities.second.id, arrive_city_id: cities.third.id, scheduled_to_depart: "2021-09-25 12:00:00" },
    { depart_city_id: cities.third.id, arrive_city_id: cities.first.id, scheduled_to_depart: "2021-07-25 12:30:00" },
    { depart_city_id: cities.third.id, arrive_city_id: cities.last.id, scheduled_to_depart: "2021-05-25 15:00:00" },
    { depart_city_id: cities.fourth.id, arrive_city_id: cities.first.id, scheduled_to_depart: "2021-10-25 16:00:00" },
    { depart_city_id: cities.fourth.id, arrive_city_id: cities.second.id, scheduled_to_depart: "2021-06-25 08:40:00" },
    { depart_city_id: cities.last.id, arrive_city_id: cities.first.id, scheduled_to_depart: "2021-05-25 09:30:00" },
    { depart_city_id: cities.last.id, arrive_city_id: cities.second.id, scheduled_to_depart: "2021-04-25 20:00:00" }
  ])