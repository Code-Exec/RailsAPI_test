# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p1 = Project.create!({name: 'Project1'})
p1.tasks.create({name: 'Do something 1', subject: 'Somthing subject'})

p2 = Project.create!({name: 'Project2'})
p2.tasks.create({name: 'Do something 2.1', subject: 'Somthing subject'})
p2.tasks.create({name: 'Do something 2.2', subject: 'Somthing subject'})
p2.tasks.create({name: 'Do something 2.3', subject: 'Somthing subject'})

p3 = Project.create!({name: 'Project3'})
p3.tasks.create({name: 'Do something 3.1', subject: 'Somthing subject'})
p3.tasks.create({name: 'Do something 3.2', subject: 'Somthing subject'})