# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p1 = Category.create(name: "General")
q1 = Question.create(text: "Sualist Nedir?")
c1 = Connect.create(category_id:"1", question_id:"1")
c2= Connect.create(category_id:"1", question_id:"2")
q2 = Question.create(text: "Sualist Kimdir?")